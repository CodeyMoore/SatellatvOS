export ARCHS = arm64
export TARGET = appletv:clang:13.4:latest
export DEBUG = 0
export FINALPACKAGE = 1
export THEOS_DEVICE_IP = 10.0.0.75
export THEOS_DEVICE_PORT = 22
export GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SatellatvOS
SatellatvOS_FILES = Tweak.xm
SatellatvOS_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += satellaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
