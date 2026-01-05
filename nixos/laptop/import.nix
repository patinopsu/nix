{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./gui.nix
      ./network.nix
      ./theming.nix
      ./users.nix
      ./misc.nix
      ./power.nix
      ./systemd.nix
      ./audio.nix
      ./virtualization.nix
      /etc/nixos/hardware.nix
    ];
}

