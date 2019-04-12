#!/usr/bin/env python
import rospy
import math
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import BumperEvent
from sensor_msgs.msg import LaserScan

def main():
    sensor_data = {"right": 0, "center": 0, "left": 0}
    rospy.init_node('scanner')

    def callback(data):
        sensor_data["right"] = data.ranges[0]
        sensor_data["center"] = data.ranges[319]
        sensor_data["left"] = data.ranges[639]

    sub = rospy.Subscriber('/scan', LaserScan, callback)

    while not rospy.is_shutdown():
        rospy.loginfo("%f", sensor_data["right"])

main()


    







"""
class WallGuide:
    def __init__(self):
        rospy.init_node('scanner')
        self.sub = rospy.Subscriber('/scan', LaserScan, self.__callback)
        self.range_right = 0
        self.range_center = 0
        self.range_left = 0

    def run(self):    
        while not rospy.is_shutdown():
            rospy.loginfo("%f", self.range_right)

    def __callback(data):
        self.range_right = data.ranges[0]
        self.range_center = data.ranges[319]
        self.range_left = data.ranges[639]

def estimate_angle_to_wall(range_right, angle_right, vel):
    r_dot = (range_right - range_right_pre)/dt
    angle = math.atan(- r_dot*sin(angle_right)/(r_dot*cos(angle_right)-vel))
    return angle

wg = WallGuide()
wg.run()
"""


