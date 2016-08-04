#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from ar_track_alvar_msgs.msg import AlvarMarkers


class TagPose:

    def __init__(self):
        #self.listener()
		TagPose.data = "No"
	
    def getData(self):
		return TagPose.data


    def callback(self, data):
        #print "********* New DATA set ************"
        
        #print type(data.markers[0].header.seq)
        #print type(data.markers[0].pose.pose.position)
        #print type(data.markers[0].id)

        d = {}
        for tag in data.markers:
            x = int(tag.pose.pose.position.x*1000)
            y = int(tag.pose.pose.position.y*1000)
            z = int(tag.pose.pose.position.z*1000)
            print tag.id, (x,y,z)
            d[tag.id] = (x,y,z)

        TagPose.data = "Works"

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
    TagPose().listener()
    print "[Node Closed]: tag_pose_listener"
    #listener()

