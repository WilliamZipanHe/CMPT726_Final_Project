#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/src/geometry/tf"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/install/lib/python3/dist-packages:/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/build/tf/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/build/tf" \
    "/home/zipanhe/anaconda3/envs/tensorflow_gpuenv/bin/python3.5" \
    "/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/src/geometry/tf/setup.py" \
    egg_info --egg-base /home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/build/tf \
    build --build-base "/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/build/tf" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/install" --install-scripts="/home/zipanhe/Desktop/cmpt726/quad_stabilization/catkin_ws/install/bin"
