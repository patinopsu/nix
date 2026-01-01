{ config, lib, pkgs, ... }:

{
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.i2c.enable = true;
  hardware.enableAllFirmware = true;

  boot.lanzaboote = lib.mkForce {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;
}
