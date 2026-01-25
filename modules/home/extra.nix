{ config, pkgs, ... }:

{
  home.username = "patin";
  home.homeDirectory = "/home/patin";
  home.stateVersion = "25.11";

  services = {
    hypridle.enable = true;
    udiskie.enable = true;
  };

  home.packages = with pkgs; ([
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
    usbutils
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rar
  ]) ++ (with pkgs.kdePackages; [
    kio
    kio-admin
    kio-extras
    dolphin-plugins
    kdesdk-thumbnailers 
    kdegraphics-thumbnailers 
    kdegraphics-mobipocket 
    kimageformats 
    kservice
    qtimageformats 
    ffmpegthumbs 
    taglib 
    baloo 
    baloo-widgets 
    dolphin
    ark
    kate
  ]);

  home.file."scripts" = {
    source = ../../src/scripts;
  };
  home.file."walls" = {
    source = ../../src/walls;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}
