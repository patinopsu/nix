{ config, lib, pkgs, inputs, ... }:

{
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
      withUWSM = true;
    };
    evolution = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    polkit_gnome
    kdePackages.dolphin
    kdePackages.ark
  ];

  services = {
    gnome = {
      evolution-data-server.enable = true;
    };
  };

  environment.sessionVariables = {
    TERMINAL= "kitty";
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
        hyprland = lib.mkForce {
          default = [
            "kde"
            "hyprland"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ]; 
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        };
      };
    };
  };
}
