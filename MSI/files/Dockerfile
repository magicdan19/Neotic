FROM magicdan/msi-ros-noetic

# install teleop packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool 

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-teleop-twist-joy
    
RUN rosdep init && \
    rosdep update && \
    rm -rf /var/lib/apt/lists/*