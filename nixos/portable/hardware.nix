{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "sd_mod" "uas" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7FFA-1BF3";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/mapper/sda2_crypt";
      fsType = "btrfs";
      options = [ "subvol=@root" "compress=zstd:3" "noatime" "discard=async" "commit=120" "space_cache=v2" "autodefrag" ];
    };

  boot.initrd.luks.devices."sda2_crypt".device = "/dev/disk/by-uuid/fc71cfc4-23ff-4da3-83d0-604169c017b4";

  fileSystems."/home" =
    { device = "/dev/mapper/sda2_crypt";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd:3" "noatime" "discard=async" "commit=120" "space_cache=v2" "autodefrag" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/sda2_crypt";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd:3" "noatime" "discard=async" "commit=120" "space_cache=v2" "autodefrag" ];
    };

  fileSystems."/swap" =
    { device = "/dev/mapper/sda2_crypt";
      fsType = "btrfs";
      options = [ "subvol=@swap" "compress=zstd:3" "noatime" "discard=async" "commit=120" "space_cache=v2" "autodefrag" ];
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

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "zstd";
    memoryPercent = 100; 
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
