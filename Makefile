ARCHS = armv7
TARGET = iphone:latest:7.0
INCLUDE_SDKVERSION = 7.0
SDKVERSION = 7.0

FW_DEVICE_IP = 192.168.1.4
export THEOS_DEVICE_IP=192.168.1.4

include theos/makefiles/common.mk

TWEAK_NAME = HiddenSettings7
HiddenSettings7_FILES = Tweak.xm
HiddenSettings7_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
