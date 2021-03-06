#!/usr/bin/env python

import math
import threading
import rospy
from std_msgs.msg import String
from ar_track_alvar_msgs.msg import AlvarMarkers
import best_action_irl as irl
import best_action_bc as bc
from relational import RelationalWorld

"""
class RelationalWorld:
 
     def __init__(self, state, names, regions):
         self.state = []
         self.possibleActions = []
         self.createState(state, names)
         self.genPossibleActions(state, regions)
 
     def createState(self, state, names):
         for x in state.keys():
             if x in names.keys():
                self.state.append(names[x]+'('+str(x)+')')
             else:
                print '[Warning]: Object type not specified.', 'Unknown object:', x
         self.state += ['near('+str(i)+', '+str(j)+')' for i in state.keys() for j in state.keys() if i!=j and self.eucledian(state[i], state[j]) < 80] 
 
     def genPossibleActions(self, state, regions):
         obj = state.keys()
         actions = ['action('+str(r)+', '+str(i)+', '+str(j)+')' for r in regions for i in obj for j in obj if i != j]
         self.possibleActions = actions+['done']

     def eucledian(self, x, y):
         return math.sqrt((x[0]-y[0])**2 + (x[1]-y[1])**2) 
"""

class Interface:

    def __init__(self):
        self.data = {}
        self.names = {}
        self.regions = ['near']

    
    @staticmethod
    def setData(self, data):
        self.data = data

    
    def helpInfo(self):
        print """
        p       : print current state
        a       : get Action
        n       : name objects
        v       : view object names
        h       : shows this information
        return  : exit
        """

    
    def viewObjNames(self):
        for i in self.names.keys():
            print i, self.names[i]


    def saveObjNames(self):
        print "Show one object at a time and name it"
        while True:
            tags = self.data.keys()
            if len(tags)>1:
                print "[Keep one object in view]: More than one object in view."
                continue

            if len(tags)==0:
                print "[Keep one object in view]: No object in view."
                continue

            print "\nSaved names: ", self.names
            print "Current Object ID:", tags
            n = raw_input("(Enter name of object,  x to cancel, z to exit)\n>> ")
            
            if n == 'z' or n == 'Z':
                print "Exiting"
                break

            if n == 'x':
                continue

            self.names[tags[0]] = n

    
    def run(self):
        self.helpInfo()

        print "Ready for new demonstartion"
        while True:
            key = raw_input(">> ")
            if key == '':
                break

            elif key == 'a' or key == 'A':
                R = RelationalWorld(self.data, self.names, self.regions)
                print 'State:', R.state
                print '\nPossible Actions:\n', R.possibleActions
                print '\nQuerying learner for available rewards....'
                
                if False:
                    Bc = bc.ActionCloning(R.state, R.possibleActions, self.regions, self.names)
                    print Bc.goodActions
                    
                else:
                    Rsa = irl.Reward(R.state, R.possibleActions, self.regions, self.names)
                    # Rsa.rsa.keys()[Rsa.rsa.values().index(max(Rsa.rsa.values()))], max(Rsa.rsa.values())
                    
                    print 'Optimal Actions: '
                    for act in Rsa.rsa.keys():
                        if Rsa.rsa[act] >= 0:
                            print act, Rsa.rsa[act]

            elif key == 'p' or key == 'P':
                R = RelationalWorld(self.data, self.names, ['near'])
                print R.state
                print self.data
            
            elif key == 'n' or key == 'N':
                self.saveObjNames()
                self.helpInfo()
                print "Ready for new demonstration"

            elif key == 'v' or key == 'V':
                self.viewObjNames()
            
            elif key == 'h' or key == 'H':
                self.helpInfo()
            
            else:
                print "Not a valid input.\nEnter h for help info."

        print "Press [Ctrl+c] to close listener node and exit!"




class TagPose:

    def __init__(self, hci):
        #self.listener()
		self.hci = hci
	

    def callback(self, data):

        d = {}
        for tag in data.markers:
            x = int(tag.pose.pose.position.x*1000)
            y = int(tag.pose.pose.position.y*1000)
            z = int(tag.pose.pose.position.z*1000)
            #print tag.id, (x,y,z)
            d[tag.id] = (x,y,z)

        self.hci.setData(hci,d)

        #rospy.loginfo(rospy.get_caller_id() + "I heard %s", data)
    

    def listener(self):

        # In ROS, nodes are uniquely named. If two nodes with the same
        # node are launched, the previous one is kicked off. The
        # anonymous=True flag means that rospy will choose a unique
        # name for our 'listener' node so that multiple listeners can
        # run simultaneously.
        rospy.init_node('tag_pose_listener', anonymous=True)

        #rospy.Subscriber("ar_pose_marker", String, callback)
        rospy.Subscriber("ar_pose_marker", AlvarMarkers, self.callback)

        # spin() simply keeps python from exiting until this node is stopped
        rospy.spin()


if __name__ == '__main__':
	hci = Interface()
	t = threading.Thread(target=hci.run)
	t.daemon = True
	t.start()

	TagPose(hci).listener()
	print "[Node Closed]: tag_pose_listener"

