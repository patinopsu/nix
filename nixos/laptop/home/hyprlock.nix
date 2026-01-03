{ config, lib, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint"; 
        };
      };

      background = lib.mkForce [
        {
          path = "${config.stylix.image}";
          blur_passes = 2;
          blur_size = 3;
        }
      ];

      input-field = lib.mkForce [
        {
          size = "200, 40";
          position = "0, 0";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          shadow_passes = 2;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          outer_color = "rgb(${config.lib.stylix.colors.base03})";
          inner_color = "rgb(${config.lib.stylix.colors.base00})";
          font_color = "rgb(${config.lib.stylix.colors.base05})";
          fail_color = "rgb(${config.lib.stylix.colors.base08})";
          check_color = "rgb(${config.lib.stylix.colors.base0A})";
        }
      ];
    };
    extraConfig = ''
      label {
        monitor =
        text = cmd[update:1000] echo "<span>$TIME</span>"
        #color = rgba(200, 200, 200, 1.0)
        font_size = 80
        font_family = Seven Segment

        position = 0, 100
        halign = center
        valign = center
      }
      label {
        monitor =
        text = cmd[update:1000] echo "Authenticating as: $DESC"
        #color = rgba(200, 200, 200, 1.0)
        font_size = 10
        font_family = Noto Sans

        position = 0, -54
        halign = center
        valign = center
      }
    '';
  };
  stylix.targets.hyprlock = {
    enable = true;
  };
}