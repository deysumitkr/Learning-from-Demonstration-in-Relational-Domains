import cv2
import math
import pickle
from record_demonstrations import Recorder
from time import gmtime, strftime

class UserInput:

    Tx = 297.6972878158592
    Ty = 241.3957474719554
    Fx = 533.8946965168722
    Fy = 538.3821700365565
    Tag_size = 0.022 #in meters

    def __init__(self):
        self.recorder = Recorder()
        self.helpInfo()
        try:
            self.names = pickle.load(open('./db/tmp/names.p', 'rb'))
        except:
            self.names = {}

    def update(self, image, data):
        for id in data.keys():
            x = data[id][0]
            y = data[id][1]
            z = data[id][2]
            
            if z > 0:
                u = int((float(x)/z)*self.Fx + self.Tx); v = int((float(y)/z)*self.Fy + self.Ty)
                ur = int((float(x+self.Tag_size)/z)*self.Fx + self.Tx); vr = int((float(y+self.Tag_size)/z)*self.Fy + self.Ty)
                radius = int(math.sqrt((u-ur)**2 + (v-vr)**2))
                cv2.circle(image, (u, v), radius, (0, 255, 255), 4)
                text = "ID: "+str(id) if id not in self.names.keys() else self.names[id]+"("+str(id)+")"
                scale = 0.5
                thick = 2
                txtSize = cv2.getTextSize(text, cv2.FONT_HERSHEY_SIMPLEX, scale, thickness=thick)
                cv2.putText(image, text, (u-(txtSize[0][0]/2),v+radius+(txtSize[0][1])+2),
                        cv2.FONT_HERSHEY_SIMPLEX, scale, (0, 0, 250), thickness=thick)
            
        cv2.imshow("Image window", image)
        key = cv2.waitKey(10)
        if key != -1 and key < 256:
            if key == 27:
                print "Exit?\npress Esc again to confirm\nPress any other key to cancel."
                if cv2.waitKey(0) == 27:
                    print "[Esc]: Abort triggered by user."
                    return True
            self.run(chr(key), data, image.copy())

        return False



    def run(self, key, data, img):
        if key == 'h' or key == 'H':
            self.helpInfo()

        elif key == 'p' or key == 'P':
            print "Absolute State: "
            for id in data.keys():
                print id, '({0:.3f}, {1:.3f}, {2:.3f}) in meters'.format(data[id][0], data[id][1], data[id][2])
            print

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
            

            cv2.imshow("Label objects", im_tmp)
            cv2.waitKey(0)


            print "Current Object ID:", id
            n = raw_input("(Enter name of object,  n for next ID, x to exit)\n>> ")
            
            if n == 'x' or n == 'X':
                print "Exiting"
                break
            elif n == 'n' or n == 'N':
                continue

            self.names[id] = n

        pickle.dump( self.names, open( './db/tmp/names.p', "w+" ) )


    def viewObjNames(self):
        if len(self.names.keys()) == 0:
            print "No Object Names Registered"
            return

        for i in self.names.keys():
            print i, self.names[i]

    def helpInfo(self):
        print """
        p       : print current state
        r       : record the current state
        d       : end of demonstration
        n       : name objects
        v       : view object names
        s       : save the DB of demonstrations
        h       : shows this information
        Esc     : exit
        """

