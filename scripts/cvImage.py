#!/usr/bin/env python
import roslib
#roslib.load_manifest('my_package')
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from ar_track_alvar_msgs.msg import AlvarMarkers

import math
from inputCV import UserInput

#from __future__ import print_function

class image_converter:

  POS = [0, {}]
  Tx = 297.6972878158592
  Ty = 241.3957474719554
  Fx = 533.8946965168722
  Fy = 538.3821700365565
  Tag_size = 0.022 #in meters

  def __init__(self):
    self.image_pub = rospy.Publisher("image_topic_2",Image)

    self.bridge = CvBridge()
    #self.image_sub = rospy.Subscriber("image_topic",Image,self.callback)
    self.image_sub = rospy.Subscriber("camera/image_raw",Image,self.callback)
    self.UI = UserInput()

  def destructor(self):
    print "Shutting Down Node"

  @staticmethod
  def setData(data):
    # numerical value at index 0 represents the persistence time for this data (after that many loop the data is
    # discarded)
    image_converter.POS = [6, data]
  
  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)


    (rows,cols,channels) = cv_image.shape
    if cols > 60 and rows > 60 :
      if self.POS[0] > 0:
        """
        for id in self.POS[1].keys():
            x = self.POS[1][id][0]
            y = self.POS[1][id][1]
            z = self.POS[1][id][2]
            if z > 0:
                u = int((float(x)/z)*self.Fx + self.Tx); v = int((float(y)/z)*self.Fy + self.Ty);
                ur = int((float(x+self.Tag_size)/z)*self.Fx + self.Tx); vr = int((float(y+self.Tag_size)/z)*self.Fy + self.Ty);
                radius = int(math.sqrt((u-ur)**2 + (v-vr)**2))
                cv2.circle(cv_image, (u, v), radius, (0, 255, 255), 6)
                cv2.putText(cv_image,"Hello World!!!", (u,v+radius), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255))
        """
        if self.UI.update(cv_image, self.POS[1]):
            #rospy.on_shutdown(self.destructor)
            rospy.signal_shutdown("Aborted by user")
        self.POS[0] -= 1

    #cv2.imshow("Image window", cv_image)
    #cv2.waitKey(3)

    try:
      self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
    except CvBridgeError as e:
      print(e)


def callback_tag(data):
    d = {}
    for tag in data.markers:
        x = (tag.pose.pose.position.x)
        y = (tag.pose.pose.position.y)
        z = (tag.pose.pose.position.z)
        #print tag.id, (x,y,z)
        d[tag.id] = (x,y,z)
    if len(d.keys())>0:
        image_converter.setData(d)


def main(args):
  ic = image_converter()
  rospy.init_node('image_converter', anonymous=True)
        
  #rospy.Subscriber("ar_pose_marker", String, callback)
  rospy.Subscriber("ar_pose_marker", AlvarMarkers, callback_tag)

  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
