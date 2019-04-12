# how to run turtle bot with full features
see p10 and p92
```
$ roslaunch dxl_armed_turtlebot dxl_armed_turtlebot_gazebo.launch
$ roslaunch dxl_armed_turtlebot dxl_armed_turtlebot_navigation.launch
```
To open controller  
```
$ roscd dxl_armed_turtbot/launch
$ rqt -p enshu.perspective
```
note that sometimes rqt doesn't show anything at this stage. Then, click `perspective` tab.
