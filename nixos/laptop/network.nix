{ config, lib, pkgs, ... }:

let
  nextdnsHost = builtins.readFile /etc/nextdns-id;
in

{
  networking = {
    hostName = "atlanta";
    wireless.enable = true;
    nameservers = [
      "45.90.28.0#${nextdnsHost}"
      "45.90.30.0#${nextdnsHost}"
      "2a07:a8c0::#${nextdnsHost}"
      "2a07:a8c1::#${nextdnsHost}"
    ];
    networkmanager = {
      enable = true;
      dhcp = "dhcpcd";
      dns = "systemd-resolved";
      wifi = {
        backend = "wpa_supplicant";
        macAddress = "stable-ssid";
      };
    };
    firewall = {
      enable =  true;
    };
  };
  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      dnsovertls = "true";
      fallbackDns = [
        "9.9.9.9"
        "149.112.112.112"
        "2620:fe::fe"
        "2620:fe::9"
      ];
    };
  };
}
