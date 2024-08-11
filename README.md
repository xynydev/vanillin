# BlueBuild VanillaOS Testing &nbsp; [![build-ublue](https://github.com/xynydev/vanillin/actions/workflows/build.yml/badge.svg)](https://github.com/xynydev/vanillin/actions/workflows/build.yml)

This is a template / testing ground for building custom images based on VanillaOS using BlueBuild.

To use this, generate a new repo based on the template. To make the builds not fail at the signing steps, follow the instructions here: https://blue-build.org/how-to/cosign/ (you can install `skopeo` on Vanilla with `sudo apt install skopeo`).

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

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/xynydev/vanillin
```

