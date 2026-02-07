{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = lib.mkForce {
        enable = false;
      };
    };
    lanzaboote = lib.mkForce {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys = {
        enable = true;
      };
    };
    plymouth = {
      enable = true;
    };
    #resumeDevice = "/dev/mapper/nix";
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      #"resume_offset=8709017"
    ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    intel-gpu-tools.enable = true;
    i2c = {
      enable = true;
    };
  };
}
