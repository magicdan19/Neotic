FROM magicdan/aarch64-ros-noetic-base:latest

RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws/src

RUN apt-get update --fix-missing && apt-get install --no-install-recommends -y \
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

RUN git clone https://github.com/ros-perception/image_pipeline.git

WORKDIR /catkin_ws

RUN rosdep init && rosdep update

RUN rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd /catkin_ws; catkin_make'

RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN /bin/bash -c '. /catkin_ws/devel/setup.bash'

COPY exec.sh exec.sh


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/aarch64-linux-gnu/tegra

# est installé par le rosdep
#executing command [apt-get install -y ros-noetic-camera-info-manager]
#executing command [apt-get install -y ros-noetic-diagnostic-updater]
#executing command [apt-get install -y ros-noetic-dynamic-reconfigure]
#executing command [apt-get install -y ros-noetic-image-transport]
#executing command [apt-get install -y libfreenect-dev]
#executing command [apt-get install -y ros-noetic-nodelet]
#executing command [apt-get install -y ros-noetic-image-proc]
#executing command [apt-get install -y ros-noetic-rgbd-launch]
#executing command [apt-get install -y ros-noetic-tf]