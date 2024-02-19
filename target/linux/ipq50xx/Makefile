include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD=ipq50xx
BOARDNAME:=Qualcomm Atheros IPQ50xx
FEATURES:=squashfs ramdisk fpu nand pcie
KERNELNAME:=Image dtbs
CPU_TYPE:=cortex-a53
SUBTARGETS:=generic

KERNEL_PATCHVER:=5.15

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-gpio-button-hotplug \
	uboot-envtools \
	kmod-qca-nss-dp swconfig \
	kmod-usb2 kmod-usb3 kmod-usb-dwc3 kmod-usb-dwc3-qcom \
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci wpad-basic-wolfssl

$(eval $(call BuildTarget))
