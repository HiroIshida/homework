#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import BumperEvent

rospy.init_node('commander')
pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)

while not rospy.is_shutdown():
    vel = Twist()
    vel.linear.x = 1
    pub.publish(vel)
    """
    direction = raw_input('w: forward, s: backward, a: left, d: right > ')
    if 'w' in direction:
        vel.linear.x = 0.5
    if 's' in direction:
        vel.linear.x = -0.5
    if 'a' in direction:
        vel.angular.z = 1.0
    if 'd' in direction:
        vel.angular.z = -1.0
    if 'q' in direction:
        break
    print vel
    pub.publish(vel)
    """
