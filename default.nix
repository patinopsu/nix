{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./modules/gui.nix
    ./modules/network.nix
    ./modules/theming.nix
    ./modules/users.nix
    ./modules/extra.nix
    ./modules/power.nix
    ./modules/security.nix
    ./modules/bluetooth.nix
    ./modules/flatpak.nix
    ./modules/packages.nix
    ./modules/audio.nix
    ./modules/printing.nix
    ./modules/vpn.nix
    ./modules/virtualization.nix
    inputs.nix-flatpak.nixosModules.nix-flatpak  
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];
}