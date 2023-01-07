
CAMERA_DEVICETREE_ROOT=$(KERNEL_SRC)/$(M)
CAMERA_KERNEL_ROOT=$(CAMERA_DEVICETREE_ROOT)/../../opensource/camera-kernel

KBUILD_OPTIONS += CAMERA_DEVICETREE_ROOT=$(KERNEL_SRC)/$(M)
KBUILD_OPTIONS += KBUILD_DTC_INCLUDE=$(CAMERA_KERNEL_ROOT)
KBUILD_OPTIONS += KBUILD_EXTMOD_DTS=.
KBUILD_OPTIONS += KERNEL_ROOT=$(ROOT_DIR)/$(KERNEL_DIR)
KBUILD_OPTIONS += MODNAME=camera-devicetree

all: dtbs

dtbs:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) dtbs $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
