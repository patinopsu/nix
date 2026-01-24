{ config, lib, pkgs, ... }:

let
  nextdnsHost = builtins.readFile /etc/nextdns-id;
in

{
  networking = {
    hostName = "fonddulac";
    wireless.enable = true;
    networkmanager = {
      enable = true;
      dhcp = "internal";
      dns = "systemd-resolved";
      wifi = {
        backend = "wpa_supplicant";
        macAddress = "stable-ssid";
      };
    };
    firewall = {
      enable = true;
    };
  };
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    resolved = {
      enable = true;
      settings.Resolve = {
        DNSOverTLS = true;
        DNSSEC = true;
        DNS = ''
          45.90.28.0#${nextdnsHost}
          45.90.30.0#${nextdnsHost}
          2a07:a8c0::#${nextdnsHost}
          2a07:a8c1::#${nextdnsHost}
        '';
      };
    };
  };
}
