{ pkgs, lib, config, ... }:

{
  options = {
    sys.vpn.enable = lib.mkEnableOption "Enable VPN Support";
  };
  config = lib.mkIf config.sys.vpn.enable {
    networking = {
      wg-quick.interfaces = {
        proton-th22 = {
          autostart = true;
          configFile = "/etc/wireguard/proton-th22.conf";
        };
      };
      firewall.extraCommands = ''
        iptables -F OUTPUT
        iptables -A OUTPUT -o lo -j ACCEPT
        iptables -A OUTPUT -o proton+ -j ACCEPT
        iptables -A OUTPUT -p udp --dport 51820 -j ACCEPT
        iptables -A OUTPUT -p tcp --dport 853 -j ACCEPT
        iptables -P OUTPUT DROP
      '';
    };
  };
}