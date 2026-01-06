{ config, lib, pkgs, inputs, ... }:

{
  home.username = "patin";
  home.homeDirectory = "/home/patin";
  home.stateVersion = "25.11";

  services = {
    hypridle.enable = true;
    udiskie.enable = true;
  };

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
    zoxide
    eza
    fzf
    wl-clipboard
    grim
    slurp
    jq
    imv
    wl-clipboard
    haruna
  ];

  home.file."scripts" = {
    source = ../../../scripts;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}
