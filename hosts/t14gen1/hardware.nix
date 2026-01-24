{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/nix";
      fsType = "btrfs";
      options = [ "subvol=@root" "noatime" "compress=zstd:1" "ssd" "discard=async" "space_cache=v2" ];
    };

  boot.initrd.luks.devices."nix".device = "/dev/disk/by-uuid/5aa92e74-34fd-44f1-9767-93a5def6e69d";

  fileSystems."/home" =
    { device = "/dev/mapper/nix";
      fsType = "btrfs";
      options = [ "subvol=@home" "noatime" "compress=zstd:1" "ssd" "discard=async" "space_cache=v2" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/nix";
      fsType = "btrfs";
      options = [ "subvol=@nix" "noatime" "compress=zstd:1" "ssd" "discard=async" "space_cache=v2" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/mapper/nix";
      fsType = "btrfs";
      options = [ "subvol=@log" "noatime" "compress=zstd:1" "ssd" "discard=async" "space_cache=v2" ];
    };

  fileSystems."/swap" =
    { device = "/dev/mapper/nix";
      fsType = "btrfs";
      options = [ "subvol=@swap" "noatime" "compress=zstd:1" "ssd" "discard=async" "space_cache=v2" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4B14-6A69";
      fsType = "vfat";
    };

  swapDevices = [
    {
      device = "/swap/swapfile";
      priority = 0;
    }
   ];

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "zstd";
    memoryPercent = 50; 
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
