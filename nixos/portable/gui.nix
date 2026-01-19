{ config, lib, pkgs, inputs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "colormix";
      bigclock = "en";
      box_title = "Patin's Portable Gospel";
      brightness_down_key = "";
      brightness_up_key = "";
      clock = "%c";
      edge_margin = "1";
    };
  };
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
      withUWSM = true;
    };
  };

  environment.sessionVariables = {
    TERMINAL = "kitty";
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
