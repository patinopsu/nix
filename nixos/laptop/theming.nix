{ pkgs, config, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-pale.yaml";
  stylix.polarity = "dark";

  stylix = {
    fonts = {
      serif = {
        name = "Noto Serif";
      };

      sansSerif = {
        name = "Noto Sans";
      };

      monospace = {
        name = "CaskaydiaCove Nerd Font Mono";
      };

      emoji = {
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 10;
        applications = 11;
      };
    };
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
    cursor = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };
  };
}