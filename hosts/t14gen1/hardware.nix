{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot = {
      initrd = {
        kernelModules = [ ];
        availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "rtsx_pci_sdmmc" ];
      };
      kernelModules = [ "kvm-intel" ];
      extraModulePackages = [ ];
    };

  boot.initrd.luks.devices."nix".device = "/dev/disk/by-uuid/e9b4001c-d913-4d90-9654-9e18df8bb76e";

  fileSystems."/" = {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd:1"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd:1"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd:1"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
    ];
  };

  fileSystems."/var/log" = {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = [
      "subvol=@log"
      "compress=zstd:1"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
