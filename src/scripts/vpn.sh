#!/usr/bin/env bash

# 1. Check for root immediately
[[ $EUID -ne 0 ]] && echo "Please run as root" && exit 1

# 2. Splash only runs ONCE at the start of the process
figlet -f doom VPN Toolkit | lolcat
echo "Made with ❤️ by Patin Muangjan"
echo "Special thanks to Gemini 3 for helping out!"
echo "-------------------------------------------"

MODE="$1"
INPUT_NAME="${2:-th22}"

# Naming Logic
CLEAN_NAME=$(echo "$INPUT_NAME" | sed 's/^proton-//')
CONFIG_NAME="proton-$CLEAN_NAME"
SERVICE="wg-quick-$CONFIG_NAME.service"

get_ip() {
    curl -fsSL --max-time 5 ip.me 2>/dev/null || echo "Request timed out"
}

# INTERNAL FUNCTIONS (to avoid recursive splash screens)
_enable_vpn() {
    local target_conf=$1
    local target_svc="wg-quick-$target_conf.service"
    
    echo "Enabling VPN: $target_conf..."
    if systemctl start "$target_svc"; then
        # Apply Kill Switch
        iptables -F OUTPUT
        iptables -A OUTPUT -o lo -j ACCEPT
        iptables -A OUTPUT -o "$target_conf" -j ACCEPT
        iptables -A OUTPUT -p udp --dport 51820 -j ACCEPT
        iptables -A OUTPUT -p tcp --dport 853 -j ACCEPT
        iptables -P OUTPUT DROP
        echo -e "\e[32mYOU ARE NOW PROTECTED\e[0m"
    else
        echo -e "\e[31mFailed to start $target_svc.\e[0m"
        exit 1
    fi
}

_disable_vpn() {
    local keep_firewall=$1
    echo "Stopping all Proton VPN services..."
    systemctl stop "wg-quick-proton-*" 2>/dev/null
    
    # If we are NOT switching, open the firewall.
    # If we ARE switching, we leave it DROP to prevent leaks.
    if [[ "$keep_firewall" != "true" ]]; then
        iptables -F OUTPUT
        iptables -P OUTPUT ACCEPT
        echo "Firewall OPEN - YOU ARE NO LONGER PROTECTED"
    else
        echo "Firewall LOCKED - Transitioning..."
    fi
}

# MAIN LOGIC
case "$MODE" in
  enable)
    _enable_vpn "$CONFIG_NAME"
    echo "Your current IP is: $(get_ip)"
    ;;

  disable)
    _disable_vpn "false"
    echo "Your current IP is: $(get_ip)"
    ;;

  switch)
    if [[ -z "$2" ]]; then
        echo "Usage: $0 switch [new-endpoint]"
        exit 1
    fi
    echo "Switching to $CONFIG_NAME..."
    # Disable services but KEEP the firewall DROP policy
    _disable_vpn "true"
    # Start the new service and update rules
    _enable_vpn "$CONFIG_NAME"
    echo "Your current IP is: $(get_ip)"
    ;;

  status)
    IFACE=$(wg show interfaces | awk '{print $1}')
    if [[ -n "$IFACE" ]]; then
        echo -e "\e[32mSTATUS: PROTECTED ($IFACE)\e[0m"
        wg show "$IFACE" | grep -E 'endpoint|latest handshake|transfer'
    else
        echo -e "\e[31mSTATUS: UNPROTECTED (No active WireGuard interface)\e[0m"
    fi
    echo "Your current IP is: $(get_ip)"
    ;;

  list)
    systemctl list-unit-files "wg-quick-proton-*" --no-legend | awk '{print $1}' | sed 's/wg-quick-proton-//;s/\.service//' | column
    ;;

  *)
    echo "Usage: $0 {enable|disable|status|list|switch} [endpoint]"
    exit 1
    ;;
esac