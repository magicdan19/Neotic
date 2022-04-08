# version pour amd64 de ros-NOETIC

FROM magicdan/msi-ros-noetic-robot:latest

ARG ROS_PKG=desktop-full
ENV ROS_DISTRO=noetic
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /catkin_ws


# 
# add the ROS deb repo to the apt sources list
#
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    cmake \
    build-essential \
    curl \
    wget \
    gnupg2 \
    lsb-release \
    ca-certificates 


RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -


# 
# install ROS packages
#
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-desktop-full \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-vision-msgs \
    python3-rosinstall-generator \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool 



#
# init/update rosdep
#
RUN apt-get update && \
    cd ${ROS_ROOT} && \
    rosdep init && \
    rosdep update && \



# 
# setup entrypoint
#
COPY ./ros_entrypoint.sh /ros_entrypoint.sh
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> /root/.bashrc
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
WORKDIR /

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
	nano \
    ros-${ROS_DISTRO}-joint-state-publisher-gui \
    ros-${ROS_DISTRO}-rviz \
    ros-${ROS_DISTRO}-gazebo11* \
    rm -rf /var/lib/apt/lists/*

    

    
