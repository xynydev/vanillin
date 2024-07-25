#!/usr/bin/env bash
set -oue pipefail

jq -r '.name |= "xynydev/vanillin"' /usr/share/abroot/abroot.json > /usr/share/abroot/abroot_tmp.json
mv /usr/share/abroot/abroot_tmp.json /usr/share/abroot/abroot.json