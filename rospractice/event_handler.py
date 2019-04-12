#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import BumperEvent

pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)
isEvent = false

def callback(data):
    rospy.loginfo("fuck")
    vel = Twist()
    vel.linear.x = -1
    print vel
    pub.publish(vel)

def event_handler():
    rospy.init_node('event_handler')
    sub = rospy.Subscriber('/mobile_base/events/bumper', BumperEvent, callback)
    rospy.spin()


while not rospy.is_shutdown():
    isEvent = false
    vel = Twist()
    vel.linear.x = 1
    pub.publish(vel)

"""
if __name__ == '__main__':
    event_handler()
    """
