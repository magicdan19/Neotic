;; Auto-generated. Do not edit!


(when (boundp 'rtabmap_ros::GetMap)
  (if (not (find-package "RTABMAP_ROS"))
    (make-package "RTABMAP_ROS"))
  (shadow 'GetMap (find-package "RTABMAP_ROS")))
(unless (find-package "RTABMAP_ROS::GETMAP")
  (make-package "RTABMAP_ROS::GETMAP"))
(unless (find-package "RTABMAP_ROS::GETMAPREQUEST")
  (make-package "RTABMAP_ROS::GETMAPREQUEST"))
(unless (find-package "RTABMAP_ROS::GETMAPRESPONSE")
  (make-package "RTABMAP_ROS::GETMAPRESPONSE"))

(in-package "ROS")





(defclass rtabmap_ros::GetMapRequest
  :super ros::object
  :slots (_global _optimized _graphOnly ))

(defmethod rtabmap_ros::GetMapRequest
  (:init
   (&key
    ((:global __global) nil)
    ((:optimized __optimized) nil)
    ((:graphOnly __graphOnly) nil)
    )
   (send-super :init)
   (setq _global __global)
   (setq _optimized __optimized)
   (setq _graphOnly __graphOnly)
   self)
  (:global
   (&optional __global)
   (if __global (setq _global __global)) _global)
  (:optimized
   (&optional __optimized)
   (if __optimized (setq _optimized __optimized)) _optimized)
  (:graphOnly
   (&optional __graphOnly)
   (if __graphOnly (setq _graphOnly __graphOnly)) _graphOnly)
  (:serialization-length
   ()
   (+
    ;; bool _global
    1
    ;; bool _optimized
    1
    ;; bool _graphOnly
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _global
       (if _global (write-byte -1 s) (write-byte 0 s))
     ;; bool _optimized
       (if _optimized (write-byte -1 s) (write-byte 0 s))
     ;; bool _graphOnly
       (if _graphOnly (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _global
     (setq _global (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _optimized
     (setq _optimized (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _graphOnly
     (setq _graphOnly (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rtabmap_ros::GetMapResponse
  :super ros::object
  :slots (_data ))

(defmethod rtabmap_ros::GetMapResponse
  (:init
   (&key
    ((:data __data) (instance rtabmap_ros::MapData :init))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; rtabmap_ros/MapData _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rtabmap_ros/MapData _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rtabmap_ros/MapData _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(defclass rtabmap_ros::GetMap
  :super ros::object
  :slots ())

(setf (get rtabmap_ros::GetMap :md5sum-) "b7c8cc7558df5f9a5f34b8ef0e469ddf")
(setf (get rtabmap_ros::GetMap :datatype-) "rtabmap_ros/GetMap")
(setf (get rtabmap_ros::GetMap :request) rtabmap_ros::GetMapRequest)
(setf (get rtabmap_ros::GetMap :response) rtabmap_ros::GetMapResponse)

(defmethod rtabmap_ros::GetMapRequest
  (:response () (instance rtabmap_ros::GetMapResponse :init)))

(setf (get rtabmap_ros::GetMapRequest :md5sum-) "b7c8cc7558df5f9a5f34b8ef0e469ddf")
(setf (get rtabmap_ros::GetMapRequest :datatype-) "rtabmap_ros/GetMapRequest")
(setf (get rtabmap_ros::GetMapRequest :definition-)
      "#request
bool global
bool optimized
bool graphOnly
---
#response
MapData data


================================================================================
MSG: rtabmap_ros/MapData

Header header

##################
# Optimized graph
##################
MapGraph graph

##################
# Graph data
##################
NodeData[] nodes




================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: rtabmap_ros/MapGraph

Header header

##
# /map to /odom transform
# Always identity when the graph is optimized from the latest pose.
##
geometry_msgs/Transform mapToOdom

# The poses
int32[] posesId
geometry_msgs/Pose[] poses

# The links
Link[] links




================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: rtabmap_ros/Link
#class rtabmap::Link
#{
#   int from;
#   int to;
#   Type type;
#   Transform transform;
#   cv::Mat(6,6,CV_64FC1) information;
#}

int32 fromId
int32 toId
int32 type
geometry_msgs/Transform transform
float64[36] information
================================================================================
MSG: rtabmap_ros/NodeData

int32 id
int32 mapId
int32 weight
float64 stamp
string label

# Pose from odometry not corrected
geometry_msgs/Pose pose

# Ground truth (optional)
geometry_msgs/Pose groundTruthPose

# GPS (optional)
GPS gps

# compressed image in /camera_link frame
# use rtabmap::util3d::uncompressImage() from \"rtabmap/core/util3d.h\"
uint8[] image

# compressed depth image in /camera_link frame
# use rtabmap::util3d::uncompressImage() from \"rtabmap/core/util3d.h\"
uint8[] depth

# Camera models
float32[] fx
float32[] fy
float32[] cx
float32[] cy
float32[] width
float32[] height
float32 baseline
# local transform (/base_link -> /camera_link)
geometry_msgs/Transform[] localTransform

# compressed 2D or 3D laser scan
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] laserScan
int32 laserScanMaxPts
float32 laserScanMaxRange
int32 laserScanFormat
# local transform (/base_link -> /base_laser)
geometry_msgs/Transform laserScanLocalTransform

# compressed user data
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] userData

# compressed occupancy grid
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] grid_ground
uint8[] grid_obstacles
uint8[] grid_empty_cells
float32 grid_cell_size
Point3f grid_view_point

# std::multimap<wordId, index>
# std::vector<cv::Keypoint>
# std::vector<cv::Point3f>
int32[] wordIdKeys
int32[] wordIdValues
KeyPoint[] wordKpts
Point3f[] wordPts
# compressed descriptors
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] wordDescriptors

GlobalDescriptor[] globalDescriptors

EnvSensor[] env_sensors

================================================================================
MSG: rtabmap_ros/GPS

float64 stamp      # in seconds
float64 longitude  # DD format
float64 latitude   # DD format
float64 altitude   # in meters
float64 error      # in meters
float64 bearing    # North 0->360 deg
================================================================================
MSG: rtabmap_ros/Point3f
#class cv::Point3f
#{
#    float x;
#    float y;
#    float z;
#}

float32 x
float32 y
float32 z
================================================================================
MSG: rtabmap_ros/KeyPoint
#class cv::KeyPoint
#{
#    Point2f pt;
#    float size;
#    float angle;
#    float response;
#    int octave;
#    int class_id;
#}

Point2f pt
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
================================================================================
MSG: rtabmap_ros/Point2f
#class cv::Point2f
#{
#    float x;
#    float y;
#}

float32 x
float32 y
================================================================================
MSG: rtabmap_ros/GlobalDescriptor

Header header

# compressed global descriptor
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
int32 type
uint8[] info
uint8[] data
================================================================================
MSG: rtabmap_ros/EnvSensor

Header header

# EnvSensor
int32 type
")

(setf (get rtabmap_ros::GetMapResponse :md5sum-) "b7c8cc7558df5f9a5f34b8ef0e469ddf")
(setf (get rtabmap_ros::GetMapResponse :datatype-) "rtabmap_ros/GetMapResponse")
(setf (get rtabmap_ros::GetMapResponse :definition-)
      "#request
bool global
bool optimized
bool graphOnly
---
#response
MapData data


================================================================================
MSG: rtabmap_ros/MapData

Header header

##################
# Optimized graph
##################
MapGraph graph

##################
# Graph data
##################
NodeData[] nodes




================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: rtabmap_ros/MapGraph

Header header

##
# /map to /odom transform
# Always identity when the graph is optimized from the latest pose.
##
geometry_msgs/Transform mapToOdom

# The poses
int32[] posesId
geometry_msgs/Pose[] poses

# The links
Link[] links




================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: rtabmap_ros/Link
#class rtabmap::Link
#{
#   int from;
#   int to;
#   Type type;
#   Transform transform;
#   cv::Mat(6,6,CV_64FC1) information;
#}

int32 fromId
int32 toId
int32 type
geometry_msgs/Transform transform
float64[36] information
================================================================================
MSG: rtabmap_ros/NodeData

int32 id
int32 mapId
int32 weight
float64 stamp
string label

# Pose from odometry not corrected
geometry_msgs/Pose pose

# Ground truth (optional)
geometry_msgs/Pose groundTruthPose

# GPS (optional)
GPS gps

# compressed image in /camera_link frame
# use rtabmap::util3d::uncompressImage() from \"rtabmap/core/util3d.h\"
uint8[] image

# compressed depth image in /camera_link frame
# use rtabmap::util3d::uncompressImage() from \"rtabmap/core/util3d.h\"
uint8[] depth

# Camera models
float32[] fx
float32[] fy
float32[] cx
float32[] cy
float32[] width
float32[] height
float32 baseline
# local transform (/base_link -> /camera_link)
geometry_msgs/Transform[] localTransform

# compressed 2D or 3D laser scan
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] laserScan
int32 laserScanMaxPts
float32 laserScanMaxRange
int32 laserScanFormat
# local transform (/base_link -> /base_laser)
geometry_msgs/Transform laserScanLocalTransform

# compressed user data
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] userData

# compressed occupancy grid
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] grid_ground
uint8[] grid_obstacles
uint8[] grid_empty_cells
float32 grid_cell_size
Point3f grid_view_point

# std::multimap<wordId, index>
# std::vector<cv::Keypoint>
# std::vector<cv::Point3f>
int32[] wordIdKeys
int32[] wordIdValues
KeyPoint[] wordKpts
Point3f[] wordPts
# compressed descriptors
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
uint8[] wordDescriptors

GlobalDescriptor[] globalDescriptors

EnvSensor[] env_sensors

================================================================================
MSG: rtabmap_ros/GPS

float64 stamp      # in seconds
float64 longitude  # DD format
float64 latitude   # DD format
float64 altitude   # in meters
float64 error      # in meters
float64 bearing    # North 0->360 deg
================================================================================
MSG: rtabmap_ros/Point3f
#class cv::Point3f
#{
#    float x;
#    float y;
#    float z;
#}

float32 x
float32 y
float32 z
================================================================================
MSG: rtabmap_ros/KeyPoint
#class cv::KeyPoint
#{
#    Point2f pt;
#    float size;
#    float angle;
#    float response;
#    int octave;
#    int class_id;
#}

Point2f pt
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
================================================================================
MSG: rtabmap_ros/Point2f
#class cv::Point2f
#{
#    float x;
#    float y;
#}

float32 x
float32 y
================================================================================
MSG: rtabmap_ros/GlobalDescriptor

Header header

# compressed global descriptor
# use rtabmap::util3d::uncompressData() from \"rtabmap/core/util3d.h\"
int32 type
uint8[] info
uint8[] data
================================================================================
MSG: rtabmap_ros/EnvSensor

Header header

# EnvSensor
int32 type
")



(provide :rtabmap_ros/GetMap "b7c8cc7558df5f9a5f34b8ef0e469ddf")


