{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot = lib.mkForce {
        enable = false;
      };
    };
    lanzaboote = lib.mkForce {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    plymouth = {
      enable = true;
    };
    initrd = {
      systemd = {
        enable = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    i2c = {
      enable = true;
    };
    enableAllFirmware = true;
  };
}
