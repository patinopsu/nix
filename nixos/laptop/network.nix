{ config, lib, pkgs, ... }:

{
  networking.hostName = "atlanta";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;
}
