# CMPT726_Final_Project

# Automatic quadcopter launching under unstructured conditions
Automatic quadcopter launching under unstructured conditionsFlexible launching of a quadrotor system remains challenging due to its highly dynamical nature. Generally, the popular commercial quadrotor (e.g. DJI) requires a trained operator to execute the launching on a plain ground with remote control. Such requirements cannot be always satisfied under certain extreme environments or emergencies. In this project, the objective is to design an automatic launching module using reinforcement learning (RL) for a nano-quadrotor system (Crazyflie 2.1), which supports more flexible launching under unstructured conditions, such as rugged ground and hand-throwing. As a short-term goal, one can first teach a quadrotor how to launch from a plain ground. The Gazebo simulator can provide accurate physical modelling of quadrotor and allow for efficient and safe training for this task. One can use neural network as a powerful, non-linear controller and select the state-of-art RL algorithm, either model-free or model-based one, to optimize the controller to achieve stable launching in simulation. Then the controller needs to be transferred and fully fine-tuned from simulation to real system. Note that this step requires the programming on hardware. Finally, put this special quadrotor on the ground and witness the magic of neuro-based fully automatic launching!
## Basic Requirement

#### 1.  Install miniconda3 (or anaconda if you like). 

#### 2.  Create a new conda environment and do all the following steps in this environment. 
```
conda create -n tensorflow_gpuenv tensorflow-gpu
conda activate tensorflow_gpuenv

```
#### 3.  Install missing python-packages
```
pip install catkin-tools
pip install rospkg
pip install -U [pkg_name]
conda install [pkg_name]
```
#### 4.  Install Gazebo8, ROS kinetic for you computer.

#### 5.  Install gazebo-ros from gazebo website. Note the matching between gazebo version and ROS version. Here I use gazebo7 and ROS kinetic.

## Trouble Shooting

#### 1.  No module named rospkg
```
pip install -U rosdep rosinstall_generator wstool rosinstall six vcstools
```
#### 2.  ImportError: dynamic module does not define module export function (PyInit__tf2)

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
   $ git clone -b noetic-devel https://github.com/ros/geometry.git
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
   Source the setup.bash again.
   ```
   source ~/Desktop/cmpt726/quad_stabilization/catkin_ws/devel/setup.bash
   ```
#### 3.  Conda: command not found
   ```
   vim ~/.bashrc
   export PATH=$PATH:/home/vincent/anaconda3/bin
   source ~/.bashrc
   ```
#### 4.  SyntaxError: invalid syntax def async
   ```
   sudo pip3 install git+https://github.com/catkin/catkin_tools.git
   ```
#### 5. Cannot find matlab.engine
   First download matlab as instrucion in MATHWORKS website
   Then do this:
   ```
   python setup.py install --prefix="/home/anaconda3/
   ```
   Finally, copy matlab folder to ~/anaconda/envs/{your_env_name}/lib/python/site-package
   ```
   conda update --all
   ```
#### 6.  Everytime you build something new in catkin_ws, remember to source the env_vars again.
   ```
   source ~/etc/conda/activate.d/env_vars.sh 
   source ~/catkin_ws/devel/setup.bash
   ```

## Additional tip  
1. stay tuned...








