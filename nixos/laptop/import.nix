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
      ./audio.nixc
      /etc/nixos/hardware.nix
    ];
}

