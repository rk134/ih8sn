LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := ih8sn.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

ifneq (,$(findstring _, $(TARGET_PRODUCT)))
  IH8SN_DEVICE := $(shell echo $(TARGET_PRODUCT) | cut -d'_' -f2-)
else
  IH8SN_DEVICE := $(TARGET_PRODUCT)
endif

ifeq ($(wildcard $(LOCAL_PATH)/system/etc/ih8sn.conf.$(IH8SN_DEVICE)),)
  IH8SN_DEVICE :=
endif

LOCAL_SRC_FILES    := system/etc/ih8sn.conf$(if $(IH8SN_DEVICE),.$(IH8SN_DEVICE))
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)
include $(BUILD_PREBUILT)
