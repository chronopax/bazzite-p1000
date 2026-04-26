# bazzite-p1000 — Custom Bazzite for NVIDIA Pascal GPUs (Quadro P1000, GTX 9xx-10xx)
# GitHub: https://github.com/chronopax/bazzite-p1000
# Based on ublue-os/image-template: https://github.com/ublue-os/image-template
#
# NVIDIA driver note:
# - Nvidia main (595.x): drops Pascal/GTX 9xx-10xx support entirely
# - Nvidia LTS (580.x): last driver branch to support Pascal — this is what we need
# - Bazzite ships both. We must use the LTS variant.
#
# If bazzite-nvidia:stable ships 595 main, switch FROM to the pinned tag:
# FROM ghcr.io/ublue-os/bazzite-nvidia:43.20260420
# (confirmed in Bazzite release notes to ship Nvidia LTS 580.95.05-1)

FROM ghcr.io/ublue-os/bazzite-nvidia:stable

# Disable terra-mesa repo — GPG key causes bootc-image-builder to fail
RUN rm -f /etc/yum.repos.d/terra-mesa.repo

### Image labels
LABEL org.opencontainers.image.title="bazzite-p1000"
LABEL org.opencontainers.image.description="Bazzite with NVIDIA 580 LTS for Pascal GPUs — HP Z2 Mini G4 / Quadro P1000"
LABEL org.opencontainers.image.source="https://github.com/chronopax/bazzite-p1000"
