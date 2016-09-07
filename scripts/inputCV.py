import cv2
import math
import pickle
from record_demonstrations import Recorder
from time import gmtime, strftime
import regions
from relational import RelationalWorld
import best_action_irl as irl
import best_action_bc as bc
from operator import itemgetter
from matplotlib import pyplot as plt
import numpy as np

class UserInput:

    Tx = 297.6972878158592
    Ty = 241.3957474719554
    Fx = 533.8946965168722
    Fy = 538.3821700365565
    Tag_size = 0.022 #in meters

    def __init__(self):
        self.recorder = Recorder()
        self.regions = RelationalWorld.region_names
        self.helpInfo()
        try:
            self.names = pickle.load(open('./db/tmp/names.p', 'rb'))
        except:
            self.names = {}

    def update(self, image, data, args):
        for id in data.keys():
            x = data[id][0]
            y = data[id][1]
            z = data[id][2]
            
            if z > 0:
                u = int((float(x)/z)*self.Fx + self.Tx); v = int((float(y)/z)*self.Fy + self.Ty)
                
                ur = int((float(x+self.Tag_size)/z)*self.Fx + self.Tx)
                vr = int((float(y+self.Tag_size)/z)*self.Fy + self.Ty)
                
                nur = int((float(x+(regions._NEAR_THRESHOLD/1000.))/z)*self.Fx + self.Tx)
                nvr = int((float(y)/z)*self.Fy + self.Ty)
                
                radius = int(math.sqrt((u-ur)**2 + (v-vr)**2))
                nRadius = int(math.sqrt((u-nur)**2 + (v-nvr)**2))
                
                cv2.circle(image, (u, v), radius, (0, 255, 255), 4)
                cv2.circle(image, (u, v), 3, (0, 150, 255), -1)
                cv2.circle(image, (u, v), nRadius, (255, 0, 0), 1)
                
                text = "ID: "+str(id) if id not in self.names.keys() else self.names[id]+"("+str(id)+")"
                scale = 0.5
                thick = 2
                txtSize = cv2.getTextSize(text, cv2.FONT_HERSHEY_SIMPLEX, scale, thickness=thick)
                cv2.putText(image, text, (u-(txtSize[0][0]/2),v+radius+(txtSize[0][1])+2),
                        cv2.FONT_HERSHEY_SIMPLEX, scale, (0, 0, 250), thickness=thick)
            
        cv2.imshow("Camera View", image)
        key = cv2.waitKey(10)
        if key != -1 and key < 256:
            if key == 27:
                print "Exit?\npress Esc again to confirm\nPress any other key to cancel."
                if cv2.waitKey(0) == 27:
                    print "[Esc]: Abort triggered by user."
                    return True
            self.run(chr(key), data, image.copy(), args)

        return False



    def run(self, key, data, img, args):
        if key == 'h' or key == 'H':
            self.helpInfo()

        elif key == 'a' or key == 'A':
            R = RelationalWorld(data, self.names)
            print 'State:', R.state
            print '\nPossible Actions:\n', R.possibleActions
            print '\nQuery learner for available rewards:'
            print 'Press b to get results from Behavioral Cloning'
            print 'Press i to get results from Inverse Reinforcement Learning'

            key2 = chr(cv2.waitKey(0))
            
            if key2 == 'b' or key2 == 'B':
                print "\nBehavioral Cloning:"
                print "Good Actions:"
                Bc = bc.ActionCloning(R.state, R.possibleActions, self.regions, self.names)
                print Bc.goodActions
                print
                fname = strftime("bc_%Y-%m-%d_%H-%M-%S.png", gmtime())
                cv2.imwrite('./db/bc/'+fname, img)
                try:
                    saveGoodActions = pickle.load(open('./db/bc/goodActions.p', 'rb'))
                except:
                    saveGoodActions = {}
                saveGoodActions[fname] = Bc.goodActions
                pickle.dump(saveGoodActions, open('./db/bc/goodActions.p', 'w+'))

                
            elif key2 == 'i' or key2 == 'I':
                print "\nInverse Reinforcement Learning:\n(camera window will be back after we get query results)"
                cv2.destroyAllWindows()
                Rsa = irl.Reward(R.state, R.possibleActions, self.regions, self.names)
                # Rsa.rsa.keys()[Rsa.rsa.values().index(max(Rsa.rsa.values()))], max(Rsa.rsa.values())
                
                print 'Optimal Actions: '
                optimalActions = []
                for act in Rsa.rsa.keys():
                    if Rsa.rsa[act] >= 0:
                        optimalActions.append((act, Rsa.rsa[act]))
                        #print act, Rsa.rsa[act]
                optimalActions = sorted(optimalActions, key=itemgetter(1))
                optimalActions.reverse()
                print optimalActions
                fname = strftime("irl_%Y-%m-%d_%H-%M-%S.png", gmtime())
                cv2.imwrite('./db/irl/'+fname, img)
                try:
                    saveOptimalActions = pickle.load(open('./db/irl/optimalActions.p', 'rb'))
                except:
                    saveOptimalActions = {}
                saveOptimalActions[fname] = optimalActions
                pickle.dump(saveOptimalActions, open('./db/irl/optimalActions.p', 'w+'))
                self.plotOptimalActions(optimalActions, fname)

            else:
                print "[Invalid Input]: Querry Action Aborted"
        
        elif key == 'p' or key == 'P':
            print "\nAbsolute State: "
            for id in data.keys():
                print id, '({0:.3f}, {1:.3f}, {2:.3f}) in meters'.format(data[id][0], data[id][1], data[id][2])
            print "\nRelational State:"
            R = RelationalWorld(data, self.names)
            print R.state

        elif key == 'v' or key == 'V':
            self.viewObjNames()

        elif key == 'r' or key == 'R':
            self.recorder.newState(data)
            fname = strftime("%Y-%m-%d_%H-%M-%S.png", gmtime())
            cv2.imwrite('./db/tmp/'+fname, img)
            

        elif key == 'd' or key == 'D':
            self.recorder.done()
            print "Ready for new demonstration"

        elif key == 'n' or key == 'N':
            self.saveObjNames(data, img)
            self.helpInfo()

        elif key == 's' or key == 'S':
            fname = raw_input('(Enter the name of file to save) >> ')
            if fname[-2:] != '.p':
                fname += '.p'
            if fname[:3] != 'db/' and fname[:5] != './db/':
                fname = 'db/'+fname
            self.recorder.save(self.names, fname)

        elif key == ' ':
            pass

        else:
            print "Not a valid input.\nEnter h for help info."

    print "Press [Ctrl+c] to close listener node and exit!"


    def saveObjNames(self, data, img):
        for id in data.keys():
            im_tmp = img.copy()
            x = data[id][0]
            y = data[id][1]
            z = data[id][2]
            
            if z > 0:
                u = int((float(x)/z)*self.Fx + self.Tx); v = int((float(y)/z)*self.Fy + self.Ty)
                ur = int((float(x+self.Tag_size)/z)*self.Fx + self.Tx); vr = int((float(y+self.Tag_size)/z)*self.Fy + self.Ty)
                radius = int(math.sqrt((u-ur)**2 + (v-vr)**2))
                cv2.circle(im_tmp, (u, v), radius, (0, 255, 0), 4)
            

            cv2.imshow("Label Objects", im_tmp)
            cv2.waitKey(10)


            print "Current Object ID:", id
            n = raw_input("(Enter name of object,  n for next ID, x to exit)\n>> ")
            
            if n == 'x' or n == 'X':
                print "Exiting"
                break
            elif n == 'n' or n == 'N':
                continue

            if n == '' and id in self.names.keys():
                del self.names[id]
            elif n != '':    
                self.names[id] = n

        pickle.dump( self.names, open( './db/tmp/names.p', "w+" ) )
        cv2.destroyWindow("Label Objects")


    def viewObjNames(self):
        if len(self.names.keys()) == 0:
            print "No Object Names Registered"
            return

        for i in self.names.keys():
            print i, self.names[i]

    def plotOptimalActions(self, optimalActions, fname):
        optimalActions.reverse()
        actionNames = []
        rsa = []
        for (name, val) in optimalActions:
            actionNames.append(name)
            rsa.append(val)
        y_pos = np.arange(len(actionNames))+0.5
        plt.barh(y_pos, rsa, align='center', height=0.6, alpha=0.5)
        plt.yticks(y_pos, actionNames)
        plt.gca().axvline(0,color='k',lw=3)
        plt.grid(True)
        plt.xlabel('R(s,a)')
        plt.title('Reward values for optimal actions')

        range = max(rsa) - min(rsa)
        plt.xlim(min(rsa)-0.1*range, max(rsa)+0.1*range)
        plt.ylim(0, max(y_pos)+0.5)
        plt.tight_layout()
        plt.savefig('./db/irl/act_'+fname, dpi=200)
        plt.show()

    def helpInfo(self):
        print """
        p       : Print current state
        r       : Record/Save the current state
        a       : Get Actions
        d       : End of demonstration
        n       : Name objects
        v       : View object names
        s       : Save the DB of demonstrations into file
        h       : Shows this information
        Esc     : Exit
        """

