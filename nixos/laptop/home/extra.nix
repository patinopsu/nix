{ config, lib, pkgs, inputs, ... }:

{
  home.username = "patin";
  home.homeDirectory = "/home/patin";
  home.stateVersion = "25.11";

  services = {
    hypridle.enable = true;
    udiskie.enable = true;
  };
  home.file.".config/kitty".source = ../../../kitty;

  home.packages = with pkgs; [
    bat
    neovim
    s-tui
    lazygit
    pavucontrol
    ddcutil
    fastfetch
    btop
    kitty
    libnotify
    scrcpy
    vscode
    google-chrome
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}
