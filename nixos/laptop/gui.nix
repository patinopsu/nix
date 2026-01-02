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
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    polkit_gnome
    libappindicator
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
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };
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
    XDG_CURRENT_DESKTOP = "hyprland";
    TERMINAL= "kitty";
    HYPR_PLUGIN_DIR = hypr-plugin-dir;
  };
}
