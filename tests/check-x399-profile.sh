#!/usr/bin/env bash
# ==========================================================
# Projet      : Eidolon-OS
# Organisation: Eidolon Core Technologies (ECT)
# Script      : check-x399-profile.sh
# Description : Valide les XML et teste nftables dans un réseau isolé
# Standard    : Eidolon Presentation Standard v1
# ==========================================================
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
readonly SCRIPT_DIR
PROFILE="$SCRIPT_DIR/../deployment/x399"
if [ "$(id -u)" -ne 0 ]; then
  echo '[ERREUR] Le test nftables nécessite root et unshare --net.' >&2
  exit 2
fi
for xml in "$PROFILE"/libvirt/*.xml; do
  case "$xml" in
    *default-network.xml) virt-xml-validate "$xml" network;;
    *) virt-xml-validate "$xml" domain;;
  esac
done
unshare --net /bin/bash -s -- "$PROFILE/network/eidolon-filter.nft" <<'NET'
set -euo pipefail
nft add table ip libvirt_sentinel
nft -f "$1"
nft -f "$1"
nft list table ip libvirt_sentinel >/dev/null
nft list chain inet eidolon_filter input | grep -q 'policy drop'
nft destroy table inet eidolon_filter
nft list table ip libvirt_sentinel >/dev/null
NET
echo '[OK] XML valides ; rechargements et arrêt préservent la table tierce isolée.'
