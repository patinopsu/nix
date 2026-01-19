{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = false;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
      timeout = 10;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}