;; Auto-generated. Do not edit!


(when (boundp 'rtabmap_ros::GlobalBundleAdjustment)
  (if (not (find-package "RTABMAP_ROS"))
    (make-package "RTABMAP_ROS"))
  (shadow 'GlobalBundleAdjustment (find-package "RTABMAP_ROS")))
(unless (find-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENT")
  (make-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENT"))
(unless (find-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENTREQUEST")
  (make-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENTREQUEST"))
(unless (find-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENTRESPONSE")
  (make-package "RTABMAP_ROS::GLOBALBUNDLEADJUSTMENTRESPONSE"))

(in-package "ROS")





(defclass rtabmap_ros::GlobalBundleAdjustmentRequest
  :super ros::object
  :slots (_type _iterations _pixel_variance _voc_matches ))

(defmethod rtabmap_ros::GlobalBundleAdjustmentRequest
  (:init
   (&key
    ((:type __type) 0)
    ((:iterations __iterations) 0)
    ((:pixel_variance __pixel_variance) 0.0)
    ((:voc_matches __voc_matches) nil)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _iterations (round __iterations))
   (setq _pixel_variance (float __pixel_variance))
   (setq _voc_matches __voc_matches)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:iterations
   (&optional __iterations)
   (if __iterations (setq _iterations __iterations)) _iterations)
  (:pixel_variance
   (&optional __pixel_variance)
   (if __pixel_variance (setq _pixel_variance __pixel_variance)) _pixel_variance)
  (:voc_matches
   (&optional __voc_matches)
   (if __voc_matches (setq _voc_matches __voc_matches)) _voc_matches)
  (:serialization-length
   ()
   (+
    ;; int32 _type
    4
    ;; int32 _iterations
    4
    ;; float32 _pixel_variance
    4
    ;; bool _voc_matches
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _type
       (write-long _type s)
     ;; int32 _iterations
       (write-long _iterations s)
     ;; float32 _pixel_variance
       (sys::poke _pixel_variance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _voc_matches
       (if _voc_matches (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _iterations
     (setq _iterations (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _pixel_variance
     (setq _pixel_variance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _voc_matches
     (setq _voc_matches (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rtabmap_ros::GlobalBundleAdjustmentResponse
  :super ros::object
  :slots ())

(defmethod rtabmap_ros::GlobalBundleAdjustmentResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass rtabmap_ros::GlobalBundleAdjustment
  :super ros::object
  :slots ())

(setf (get rtabmap_ros::GlobalBundleAdjustment :md5sum-) "2e1ed640ba9f481fdaa2226734d70674")
(setf (get rtabmap_ros::GlobalBundleAdjustment :datatype-) "rtabmap_ros/GlobalBundleAdjustment")
(setf (get rtabmap_ros::GlobalBundleAdjustment :request) rtabmap_ros::GlobalBundleAdjustmentRequest)
(setf (get rtabmap_ros::GlobalBundleAdjustment :response) rtabmap_ros::GlobalBundleAdjustmentResponse)

(defmethod rtabmap_ros::GlobalBundleAdjustmentRequest
  (:response () (instance rtabmap_ros::GlobalBundleAdjustmentResponse :init)))

(setf (get rtabmap_ros::GlobalBundleAdjustmentRequest :md5sum-) "2e1ed640ba9f481fdaa2226734d70674")
(setf (get rtabmap_ros::GlobalBundleAdjustmentRequest :datatype-) "rtabmap_ros/GlobalBundleAdjustmentRequest")
(setf (get rtabmap_ros::GlobalBundleAdjustmentRequest :definition-)
      "# Global Bundle Adjustment service
#
#       Perform global bundle adjustment. Note that as soon as the map 
#       is modified again, the graph is re-optimized the standard way (without SBA).
#       It then makes only sense to use this after a mapping run (and after a call 
#       to /rtabmap/pause) when you know that the robot will restart in localization 
#       mode the next time, or at the beginning of the localization session.
#

# Optimizer type (0=g2o, 1=CVSBA), default 0
int32 type

# Iterations,        default 0 (use Optimizer/Iterations already loaded in the node)
int32 iterations

# Pixel variance,    default 0 (use g2o/PixelVariance already loaded in the node)
float32 pixel_variance

# Use vocabulary matches, default false (rematch all features between frames)
bool voc_matches
---
# return false if failure

")

(setf (get rtabmap_ros::GlobalBundleAdjustmentResponse :md5sum-) "2e1ed640ba9f481fdaa2226734d70674")
(setf (get rtabmap_ros::GlobalBundleAdjustmentResponse :datatype-) "rtabmap_ros/GlobalBundleAdjustmentResponse")
(setf (get rtabmap_ros::GlobalBundleAdjustmentResponse :definition-)
      "# Global Bundle Adjustment service
#
#       Perform global bundle adjustment. Note that as soon as the map 
#       is modified again, the graph is re-optimized the standard way (without SBA).
#       It then makes only sense to use this after a mapping run (and after a call 
#       to /rtabmap/pause) when you know that the robot will restart in localization 
#       mode the next time, or at the beginning of the localization session.
#

# Optimizer type (0=g2o, 1=CVSBA), default 0
int32 type

# Iterations,        default 0 (use Optimizer/Iterations already loaded in the node)
int32 iterations

# Pixel variance,    default 0 (use g2o/PixelVariance already loaded in the node)
float32 pixel_variance

# Use vocabulary matches, default false (rematch all features between frames)
bool voc_matches
---
# return false if failure

")



(provide :rtabmap_ros/GlobalBundleAdjustment "2e1ed640ba9f481fdaa2226734d70674")


