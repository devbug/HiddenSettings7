ARCHS = armv7
TARGET = iphone:latest:7.0
INCLUDE_SDKVERSION = 7.0
SDKVERSION = 7.0

FW_DEVICE_IP = 192.168.1.4

include theos/makefiles/common.mk

TWEAK_NAME = HiddenSettings7
HiddenSettings7_FILES = Tweak.xm
HiddenSettings7_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	scp -P 22 "$(FW_PROJECT_DIR)/.theos/obj/$(TWEAK_NAME).dylib" root@$(FW_DEVICE_IP):
	scp -P 22 "$(FW_PROJECT_DIR)/$(TWEAK_NAME).plist" root@$(FW_DEVICE_IP):
	ssh root@$(FW_DEVICE_IP) "mv $(TWEAK_NAME).* /Library/MobileSubstrate/DynamicLibraries/"
after-remoteinstall::
	ssh root@$(FW_DEVICE_IP) "killall -9 SpringBoard"
