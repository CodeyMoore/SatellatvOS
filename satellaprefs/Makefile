export ARCHS = arm64
export TARGET = appletv:clang:13.4:latest

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SatellaPrefs
SatellaPrefs_FILES = $(wildcard *.mm)
SatellaPrefs_INSTALL_PATH = /Library/PreferenceBundles
SatellaPrefs_FRAMEWORKS = UIKit TVSettingKit 
SatellaPrefs_PRIVATE_FRAMEWORKS = TVSettingKit
SatellaPrefs_CFLAGS+= -I. -ITVSettings -ITVSettingsKit
SatellaPrefs_LDFLAGS = -undefined dynamic_lookup


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SatellaPrefs.plist$(ECHO_END)
