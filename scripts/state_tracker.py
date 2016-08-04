#!/usr/bin/env python
import threading
import rospy
from std_msgs.msg import String
from ar_track_alvar_msgs.msg import AlvarMarkers


class Interface:

	def __init__(self):
		self.data = {}

	@staticmethod
	def setData(self, data):
		self.data = data

	def run(self):
		while True:
			key = raw_input(">> ")
			if key == '':
				break
			else:
				print self.data




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

