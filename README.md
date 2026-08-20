# bazzite-p1000

Custom Bazzite image for NVIDIA Pascal GPUs (Quadro P1000, GTX 9xx-10xx series).

Requires the NVIDIA 580 driver branch — the last branch with Pascal support.
The container build verifies this requirement and fails instead of publishing
an incompatible image if the moving Bazzite `stable` tag changes driver branch.
Built for the HP Z2 Mini G4 as a console-style couch gaming box.

The image builds on pushes and pull requests, or manually from GitHub Actions.
The former daily schedule was removed to avoid unattended runner usage.

## Target Hardware
- HP Z2 Mini G4
- Intel i7-8700, 16GB RAM
- NVIDIA Quadro P1000 (Pascal/GP107)
- 256GB SSD, Intel AX210 WiFi 6E

## Use Case
Steam Big Picture, EmuDeck, xCloud streaming, Xbox controller support OOB.

## Based On
- [ublue-os/image-template](https://github.com/ublue-os/image-template)
- [Bazzite](https://github.com/ublue-os/bazzite)

## Verify NVIDIA after boot

The Quadro P1000 is supported by NVIDIA 580. If the graphical session still
does not use the GPU, capture the installed driver, bound kernel module, and
boot errors with:

```bash
nvidia-smi
rpm -q nvidia-driver-libs kmod-nvidia
lspci -nnk -d 10de:
journalctl -b -k | grep -Ei 'nvidia|nouveau|NVRM'
```

A missing or unloaded `nvidia` module points to a boot, Secure Boot, or device
binding problem rather than the P1000 being absent from the Linux driver.
