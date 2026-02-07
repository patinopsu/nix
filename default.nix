{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/extra.nix
    ./modules/flatpak.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/plasma.nix
    ./modules/power.nix
    ./modules/printing.nix
    ./modules/security.nix
    ./modules/theming.nix
    ./modules/users.nix
    ./modules/virtualization.nix
    inputs.stylix.nixosModules.stylix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.home-manager.nixosModules.home-manager
  ];
}
