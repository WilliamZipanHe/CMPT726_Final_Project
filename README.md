# CMPT726_Final_Project

# Quadcopter stablization 

## Basic Requirement

1.  Install miniconda3 (or anaconda if you like). 

2.  Create a new conda environment and do all the following steps in this environment. 
```
conda create -n tensorflow_gpuenv tensorflow-gpu
conda activate tensorflow_gpuenv

```
3.  Install missing python-packages
```
pip install catkin-tools
pip install rospkg
pip install -U [pkg_name]
conda install [pkg_name]
```
4.  Install Gazebo8, ROS kinetic for you computer.

5.  Install gazebo-ros from gazebo website. Note the matching between gazebo version and ROS version. Here I use gazebo7 and ROS kinetic.

## Trouble Shooting

1.  No module named rospkg
```
pip install -U rosdep rosinstall_generator wstool rosinstall six vcstools
```
2.  ImportError: dynamic module does not define module export function (PyInit__tf2)

   + First, create catkin_ws folder at whereever you want: 
   ```
   mkdir catkin_ws
   cd catkin_ws
   mkdir src
   cd src
   ```
   + Second, download ROS package tf2, tf, hector_sensor_description from github into src folder
   ```
   $ git clone -b neotic-devel https://github.com/ros/geometry2.git
   ```
   + Third, re-build these packages using catkin build command:
   ```
   catkin build -DPYTHON_EXECUTABLE=path_to_miniconda/envs/[env_name]/bin/python3.5
   ```
   + Finally,
   Edit $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh again:
   ```
   source /opt/ros/kinetic/setup.bash
   source path_to_catkin_ws/catkin_ws/devel/setup.bash
   ```
3.  Conda: command not found
   ```
   vim ~/.bashrc
   export PATH=$PATH:/home/vincent/anaconda3/bin
   source ~/.bashrc
   ```
4.  SyntaxError: invalid syntax def async
   ```
   sudo pip3 install git+https://github.com/catkin/catkin_tools.git
   ```

5.  Everytime you build something new in catkin_ws, remember to source the env_vars again.

6.  For this project, you also need edit on env_vars.sh like:
```
alias killgazebogym='killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient'
```


## Additional tip  
1. stay tuned...








