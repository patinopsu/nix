{ pkgs, lib, config, ... }:

{
  networking.hostName = "fonddulac";
  sys = {
    vpn.enable = true;
    virtualization = {
      enable = false;
      kvmgt.enable = false;
    };
    bluetooth.enable = false;
  };
}