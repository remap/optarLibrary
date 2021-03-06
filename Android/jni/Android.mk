
MY_LOCAL_PATH := $(call my-dir)
LOCAL_PATH=$(MY_LOCAL_PATH)
# $(info $(LOCAL_PATH))

# include roscpp
include $(LOCAL_PATH)/../../thirdparty/roscpp/roscpp_android_ndk/jni/Android.mk

LOCAL_PATH=$(MY_LOCAL_PATH)

include $(CLEAR_VARS)

OPENCV_CAMERA_MODULES:=off
OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=SHARED
include ../thirdparty/OpenCV-android-sdk/sdk/native/jni/OpenCV.mk

LOCAL_MODULE    := optar
LOCAL_CFLAGS    := -std=c++11 -g -O0 -DDEBUG
LOCAL_CPPFLAGS  := -isystem $(LOCAL_PATH)/../../source/ros/
LOCAL_CPP_FEATURES := exceptions
LOCAL_SRC_FILES := ../../source/optar.cpp ../../source/logging.cpp ../../source/ros/ros-client.cpp ../../source/utils/clock.cpp ../../source/types.cpp
LOCAL_C_INCLUDES += ../../source ../thirdparty/spdlog/include $(LOCAL_PATH)/../../thirdparty/roscpp/roscpp_android_ndk/include
LOCAL_LDFLAGS := -Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libgnustl_shared.so
LOCAL_LDLIBS    += -llog -ldl -lGLESv3 -lz
LOCAL_STATIC_LIBRARIES := roscpp_android_ndk
include $(BUILD_SHARED_LIBRARY)
