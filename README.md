# Common Android device tree for Xiaomi devices with SDM710 SoC running mainline kernel

## Before flashing the Android build

1. Erase dtbo partition: `fastboot erase dtbo`
2. Flash the appropriate U-Boot build from [here](prebuilts) to boot partition.

## Notes regarding USB

Due to an issue with USB in the mainline kernel, the device appears to hang on the second USB insertion.

Therefore:

- Please flash the build by flashing the built images via fastbootd mode in Android recovery with downstream kernel. Flashing via in Android recovery with mainline kernel may NOT work. Flashing the OTA package in Android recovery with downstream kernel will NOT work, due to lack of some recently required userspace APIs in the kernel.
- When booting the recovery image built from this device tree, it will NOT enter recovery mode by default. This is because of we want a usable ADB interface at least. To start recovery mode, run the ADB command `adb shell start recovery`.

## Additional repositories required to build

| Path | Source |
|------|--------|
| kernel/mainline/sdm670-mainline | https://github.com/ellyq/sdm710-mainline (branch: `on-stable`) |
| vendor/xiaomi/sdm710-common | https://wiki.lineageos.org/devices/pyxis/build/variant1/#extract-proprietary-blobs |

## Kernel edits

- After applying kernel patches specified below, on `mm/Kconfig`, on config option `MEMFD_ASHMEM_SHIM`, remove the dependency on `ASHMEM_C`.

## Kernel patches

| Commit name | Purpose | Source |
|-------------|---------|--------|
| `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` | Fixes USB in normal mode | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-usb-gadget-configfs-Add-Uevent-to-notify-userspace.patch |
| `ANDROID: mm/memfd-ashmem-shim: Introduce shim layer` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-memfd-ashmem-shim-Introduce-shim-layer.patch |
| `ANDROID: mm: shmem: Use memfd-ashmem-shim ioctl handler"` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-shmem-Use-memfd-ashmem-shim-ioctl-handler.patch |
