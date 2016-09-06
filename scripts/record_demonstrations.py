#!/usr/bin/env python
import threading
import pickle
import copy

import rospy
from std_msgs.msg import String
from ar_track_alvar_msgs.msg import AlvarMarkers


class Recorder:

    def __init__(self):
        self.demo = []
        self.db = []
        self.running = False

    def newState(self, data):
        self.demo.append(data)
        print self.demo
        self.running = True

    def done(self):
        self.db.append(copy.copy(self.demo))
        self.demo = []
        self.running = False
        print "Demonstrations Recorded:", len(self.db)

    def save(self, objectNames, fileName):
        if self.running:
            print "The current demonstration is still running.\n Press d to end the current demonstration and try again."
            return

        print "saving "
        print objectNames
        print self.db
        pickle.dump( [objectNames, self.db], open( fileName, "w+" ) )



class Interface:

    def __init__(self):
        self.data = {}
        self.recorder = Recorder()
        self.names = {}

    @staticmethod
    def setData(self, data):
        self.data = data


    def viewObjNames(self):
        for i in self.names.keys():
            print i, self.names[i]

    def helpInfo(self):
        print """
        r       : record the current state
        d       : end of demonstration
        n       : name objects
        v       : view object names
        s       : save the DB of demonstrations
        h       : shows this information
        return  : exit
        """


    def saveObjNames(self):
        self.names = {}
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

            elif key == 'p' or key == 'P':
                print self.data
            
            elif key == 'r' or key == 'R':
                self.recorder.newState(self.data)

            elif key == 'd' or key == 'D':
                self.recorder.done()
                print "Ready for new demonstration"

            elif key == 'n' or key == 'N':
                self.saveObjNames()
                self.helpInfo()
                print "Ready for new demonstration"

            elif key == 'v' or key == 'V':
                self.viewObjNames()
            
            elif key == 's' or key == 'S':
                fname = raw_input('(Enter the name of file to save) >> ')
                if fname[-2:] != '.p':
                    fname += '.p'
                if fname[:3] != 'db/' and fname[:5] != './db/':
                    fname = 'db/'+fname
                self.recorder.save(self.names, fname)

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

