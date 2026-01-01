{ config, lib, pkgs, inputs, ... }:

with lib; let
  hyprPluginPkgs = inputs.hyprland-plugins.packages.${pkgs.system};
  hypr-plugin-dir = pkgs.symlinkJoin {
    name = "hyrpland-plugins";
    paths = with hyprPluginPkgs; [
      hyprscrolling
    ];
  };
in

{
  #services.displayManager = {};
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    kdePackages.kirigami
    libsForQt5.qt5.qtgraphicaleffects
    desktop-file-utils
    kdePackages.gwenview
    kdePackages.plasma-workspace
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kdf
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.qtwayland
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.qtsvg
    kdePackages.kservice
    shared-mime-info
    kdePackages.kate
    kdePackages.ark
    haruna
  ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  qt = {
    enable = true;
    style = "breeze";
    platformTheme = "qt5ct";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
    hyprland = {
      default =  lib.mkForce [
        "kde"
        "hyprland"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
      };
    };
  };
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    TERMINAL= "kitty";
    HYPR_PLUGIN_DIR = hypr-plugin-dir;
  };
}
