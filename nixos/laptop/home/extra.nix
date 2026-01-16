{ config, pkgs, ... }:

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
    firefox
    wl-clipboard
    zoxide
    eza
    fzf
    grim
    slurp
    jq
    imv
    haruna
    lolcat
    figlet
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.breeze-icons
    kdePackages.dolphin-plugins
    kdePackages.kdesdk-thumbnailers 
    kdePackages.kdegraphics-thumbnailers 
    kdePackages.kdegraphics-mobipocket 
    kdePackages.kimageformats 
    kdePackages.calligra 
    kdePackages.qtimageformats 
    kdePackages.ffmpegthumbs 
    kdePackages.taglib 
    kdePackages.baloo 
    kdePackages.baloo-widgets 
    kdePackages.dolphin
  ];

  home.file."scripts" = {
    source = ../../../scripts;
  };
  home.file."walls" = {
    source = ../../../walls;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}
