# SPDX-License-Identifier: GPL-2.0-or-later

include $(TOPDIR)/rules.mk

PKG_NAME:=qca-bt-firmware
PKG_RELEASE:=1

PKG_MAINTAINER:=George Moussalem <george.moussalem@outlook.com>

include $(INCLUDE_DIR)/package.mk

define Package/qca-bt-firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
endef

define Build/Compile
	true
endef

# IPQ5018 Maple Bluetooth Firmware
define Package/ipq5018-maple-bt-firmware
  $(Package/qca-bt-firmware-default)
  TITLE:=Qualcomm IPQ5018 maple bluetooth firmware
  DEPENDS:=@TARGET_qualcommax
endef

define Package/ipq5018-maple-bt-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/qca
	$(INSTALL_DATA) \
		./files/* \
		$(1)/lib/firmware/qca/
endef

$(eval $(call BuildPackage,ipq5018-maple-bt-firmware))
