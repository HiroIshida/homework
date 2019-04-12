#!usr/bin/env python
import rospy
from std_msgs.msg import String
from kobuki_msgs.msg import BumperEvent
from geometry_msgs.msg import Twist

rospy.init_node('vel_bumper_ishida')
pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)

def callback(bumper):
    print bumper
    vel = Twist()
    vel.linear.x = -1.5 
    pub.publish(vel)

sub = rospy.Subscriber('/mobile_base/events/bumper', BumperEvent, callback)

while not rospy.is_shutdown():
    vel = Twist()
    direction = raw_input('f: forward, b:backward, l:left, r: right > ')
    if 'f' in direction:
        vel.linear.x = 1
    if 'b' in direction:
        vel.linear.x = -1
    if 'l' in direction:
        vel.angular.z = 2
    if 'r' in direction:
        vel.angular.z = -2
    if 'q' in direction:
        break
    print vel
    pub.publish(vel)








