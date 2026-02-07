{ config, lib, pkgs, ... }:

{
  options = {
    sys.virtualization.enable = lib.mkEnableOption "Enable Virtualisation Support";
    sys.virtualization.kvmgt.enable = lib.mkEnableOption "Wheater to enable kvmgt support, Needed for Intel GVT-g";
  };
}
