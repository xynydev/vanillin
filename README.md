# BlueBuild VanillaOS Testing &nbsp; [![build-ublue](https://github.com/xynydev/vanillin/actions/workflows/build.yml/badge.svg)](https://github.com/xynydev/vanillin/actions/workflows/build.yml)

This is a template / testing ground for building custom images based on VanillaOS using BlueBuild.

To use this, generate a new repo based on this template. To make the builds not fail at the signing step, follow the instructions here: https://blue-build.org/how-to/cosign/ (you can install `skopeo` on Vanilla with `sudo apt install skopeo`).

## Installation

To rebase an existing VanillaOS installation to the latest build:

- First change your base image to the custom image:
  ```
  IMAGE=xynydev/vanillin # change this
  host-shell -- run0 bash -c "jq -r '.name |= \"$IMAGE\"' /etc/abroot/abroot.json > /etc/abroot/abroot_tmp.json && mv /etc/abroot/abroot_tmp.json /etc/abroot/abroot.json"
  ```
- Upgrade and reboot to complete the installation:
  ```
  abroot upgrade
  host-shell -- systemctl reboot
  ```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/xynydev/vanillin
```

