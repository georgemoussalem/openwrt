include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=ipq50xx
BOARDNAME:=Qualcomm Atheros IPQ50xx
FEATURES:=squashfs ramdisk fpu nand pcie
KERNELNAME:=Image dtbs
CPU_TYPE:=cortex-a53
SUBTARGETS:=generic

KERNEL_PATCHVER:=5.15

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += \
	kmod-usb-dwc3 kmod-usb-dwc3-qcom \
	kmod-qca-nss-dp swconfig \
	ath11k-firmware-ipq5018 kmod-ath11k-ahb kmod-ath11k-pci \
	wpad-basic-mbedtls uboot-envtools \
	e2fsprogs kmod-fs-ext4 losetup

$(eval $(call BuildTarget))
