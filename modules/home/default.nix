{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./browsers.nix
    ./extra.nix
    ./fastfetch.nix
    ./git.nix
    ./hmcfg.nix
    ./hyprland.nix
    ./kitty.nix
    ./noctalia.nix
    ./packages.nix
    ./spicetify.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
    ./zed.nix

    # Variables
    ../../src/options.nix

    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.noctalia.homeModules.default
  ];
}
