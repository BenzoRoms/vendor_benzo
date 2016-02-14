LOCAL_PATH := $(call my-dir)

# Install KernelAdiutor
include $(CLEAR_VARS)
LOCAL_MODULE := KernelAdiutor
LOCAL_SRC_FILES := KernelAdiutor/KernelAdiutor.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

# Install LMT Launcher
include $(CLEAR_VARS)
LOCAL_MODULE := LMT
LOCAL_SRC_FILES := LMT/LMT.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libTouchServiceNative.so
include $(BUILD_PREBUILT)

# Install Viper4Android
include $(CLEAR_VARS)
LOCAL_MODULE := ViPER4Android_FX_A4.x
LOCAL_SRC_FILES := ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi/libV4AJniUtils.so
include $(BUILD_PREBUILT)

