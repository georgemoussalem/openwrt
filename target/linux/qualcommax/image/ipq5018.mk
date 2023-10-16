define Device/FitImage
	KERNEL_SUFFIX := -uImage.itb
	KERNEL = kernel-bin | libdeflate-gzip | fit gzip $$(KDIR)/image-$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitImageLzma
	KERNEL_SUFFIX := -uImage.itb
	KERNEL = kernel-bin | lzma | fit lzma $$(KDIR)/image-$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/EmmcImage
	IMAGES += factory.bin sysupgrade.bin
	IMAGE/factory.bin := append-rootfs | pad-rootfs | pad-to 64k
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to 64k | sysupgrade-tar rootfs=$$$$@ | append-metadata
endef

define Device/UbiFit
	KERNEL_IN_UBI := 1
	IMAGES := factory.ubi sysupgrade.bin
	IMAGE/factory.ubi := append-ubi
	IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef

define Device/linksys_mx2000
	$(call Device/FitImage)
	DEVICE_VENDOR := Linksys
	DEVICE_MODEL := MX2000
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	KERNEL_SIZE := 8192k
	IMAGE_SIZE := 83968k
	SOC := ipq5018
	UBINIZE_OPTS := -E 5	# EOD marks to "hide" factory sig at EOF
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | linksys-image type=MX2000
	DEVICE_PACKAGES := ipq-wifi-linksys_mx2000 kmod-spi-dev
endef
TARGET_DEVICES += linksys_mx2000

define Device/linksys_mx5500
	$(call Device/FitImage)
	DEVICE_VENDOR := Linksys
	DEVICE_MODEL := MX5500
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	KERNEL_SIZE := 8192k
	IMAGE_SIZE := 83968k
	SOC := ipq5018
	UBINIZE_OPTS := -E 5	# EOD marks to "hide" factory sig at EOF
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | linksys-image type=MX5500
	DEVICE_PACKAGES := ipq-wifi-linksys_mx5500 ath11k-firmware-qcn9074 kmod-spi-dev kmod-bluetooth
endef
#TARGET_DEVICES += linksys_mx5500
