# Android device tree for Xiaomi devices with SDM710 SoC running mainline kernel

## Before flashing the Android build

1. Erase dtbo partition: `fastboot erase dtbo`

## Additional repositories required to build

| Path | Source |
|------|--------|
| kernel/mainline/sdm710-mainline | https://github.com/sdm710-mainline/linux (branch: `v6.19`) |
| vendor/xiaomi/pyxis | https://wiki.lineageos.org/devices/pyxis/build/variant1/#extract-proprietary-blobs |

## Kernel patches

| Commit name | Purpose | Source |
|-------------|---------|--------|
| `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` | Fixes USB in normal mode | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-usb-gadget-configfs-Add-Uevent-to-notify-userspace.patch |
| `ANDROID: mm/memfd-ashmem-shim: Introduce shim layer` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-memfd-ashmem-shim-Introduce-shim-layer.patch |
| `ANDROID: mm: shmem: Use memfd-ashmem-shim ioctl handler"` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-shmem-Use-memfd-ashmem-shim-ioctl-handler.patch |
| `Revert "dm: fix copying after src array boundaries"` | Fixes kernel crash during APEX mount on 6.15 | `git revert f1aff4bc199cb92c055668caed65505e3b4d2656` |
| `Revert "dm: always update the array size in realloc_argv on success"` | Fixes kernel crash during APEX mount on 6.15 | `git revert 5a2a6c428190f945c5cbf5791f72dbea83e97f66` |
