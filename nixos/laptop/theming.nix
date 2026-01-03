{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  stylix.image = /home/patin/Pictures/walls/anime_skull.png;
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
  };
}