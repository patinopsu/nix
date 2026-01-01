{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./gui.nix
      ./network.nix
      ./users.nix
      ./misc.nix
      /etc/nixos/hardware.nix
    ];
}

