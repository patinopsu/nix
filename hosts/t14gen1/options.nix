{ pkgs, lib, config, ... }:

{
  networking.hostName = "fonddulac";
  sys = {
    vpn.enable = true;
    virtualization = {
      enable = true;
      kvmgt.enable = true;
    };
    bluetooth.enable = true;
  };
}