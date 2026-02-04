#!/bin/bash

# Download all skill icons for GitHub profile

set -e

ICONS_DIR="icons"
mkdir -p "$ICONS_DIR"

echo "Downloading icons to $ICONS_DIR/..."

download_icon() {
    local url="$1"
    local name="$2"
    local output="$ICONS_DIR/$name.svg"

    echo "  Downloading $name..."
    if curl -sfL "$url" -o "$output"; then
        echo "    ✓ $name"
    else
        echo "    ✗ Failed to download $name"
        return 1
    fi
}

SYVIXOR_ICONS=(
    ansible apache arch argocd aws azure bash bootstrap c caddyserver cisco
    confluence css debian digitalocean django docker elasticsearch fastapi
    flask git github githubactions gitlab go grafana haproxy html java jenkins
    jira k3s kafka keycloak kubernetes linux loki macos mysql nginx nmap
    openvpn packer php podman postgresql prometheus proxmox python rabbitmq
    redis rest sql sqlite terraform traefik ubuntu vagrant valkey vault
    virtualbox vmware windows
)

for icon in "${SYVIXOR_ICONS[@]}"; do
    download_icon "https://skills.syvixor.com/api/icons?i=$icon" "$icon"
done

SIMPLE_ICONS=(
    bamboo beats borgbackup elastic exoscale fluentbit forgejo helm hetzner
    icinga kibana letsencrypt logstash mikrotik netdata opentofu opnsense
    owasp pfsense puppet rancher scaleway semaphoreci sonarqubeserver thanos
    trivy uptimekuma wireguard wireshark
)

for icon in "${SIMPLE_ICONS[@]}"; do
    download_icon "https://cdn.simpleicons.org/$icon" "$icon"
done

DASHBOARD_ICONS=(
    "aws-ecs"
    "nagios"
)

for icon in "${DASHBOARD_ICONS[@]}"; do
    download_icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/$icon.svg" "$icon"
done

download_icon "https://www.svgrepo.com/show/448269/azure-aks.svg" "azure-aks"
download_icon "https://raw.githubusercontent.com/vmware-tanzu/velero/main/site/static/img/Velero.svg" "velero"
