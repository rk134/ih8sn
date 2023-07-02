## ih8sn
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/props \
    system/etc/props.conf \
    system/etc/init/props.rc

PRODUCT_PACKAGES += props

PRODUCT_CONFIGURATION_FILE := props.conf.$(shell echo $(TARGET_PRODUCT) | cut -d'_' -f2-)

ifneq ("$(wildcard ih8sn/system/etc/$(PRODUCT_CONFIGURATION_FILE))","")
PRODUCT_COPY_FILES += \
    ih8sn/system/etc/$(PRODUCT_CONFIGURATION_FILE):$(TARGET_COPY_OUT_SYSTEM)/etc/props.conf
else
PRODUCT_COPY_FILES += \
    ih8sn/system/etc/props.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/props.conf
endif
