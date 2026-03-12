{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./browsers.nix
    ./extra.nix
    ./fastfetch.nix
    ./git.nix
    ./hmcfg.nix
    ./hyprland.nix
    ./hyprshell.nix
    ./kitty.nix
    ./noctalia.nix
    ./packages.nix
    ./spicetify.nix
    ./ssh.nix
    ./vicinae.nix
    ./vscode.nix
    ./zsh.nix
    ./zed.nix

    # Variables
    ../vars/default.nix

    # Home Manager Modules
    inputs.vicinae.homeManagerModules.default
    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.noctalia.homeModules.default
    inputs.hyprshell.homeModules.hyprshell
  ];
}
