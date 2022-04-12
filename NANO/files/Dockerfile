FROM magicdan/aarch64-ros-noetic-base

RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws/src

RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    cmake \
    build-essential \
    curl \
    wget \
    gnupg2 \
    lsb-release \
    ca-certificates \
    python3-rosinstall-generator \
    python3-rosdep \
    python3-rosinstall \
    python3-wstool 

RUN git clone https://github.com/ros-drivers/freenect_stack.git

WORKDIR /catkin_ws

RUN rosdep init && rosdep update

RUN rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd /catkin_ws; catkin_make'

RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN /bin/bash -c '. /catkin_ws/devel/setup.bash'

COPY exec.sh exec.sh