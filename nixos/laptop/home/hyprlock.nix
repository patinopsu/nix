#  _   _                  _            _    
# | | | |_   _ _ __  _ __| | ___   ___| | __
# | |_| | | | | '_ \| '__| |/ _ \ / __| |/ /
# |  _  | |_| | |_) | |  | | (_) | (__|   < 
# |_| |_|\__, | .__/|_|  |_|\___/ \___|_|\_\
#        |___/|_| 
# Thank you @FireDrop6000 on GitHub for Inspiration!

{ config, lib, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo $(date +\"%a %b %d\")"; 
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 20;
          font_family = "SF Pro Display Bold";
          position = "0, 405";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 93;
          font_family = "SF Pro Display Bold";
          position = "0, 310";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "$DESC";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 12;
          font_family = "SF Pro Display Bold";
          position = "0, -407";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Enter Password or You don't gain access";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 10;
          font_family = "SF Pro Display";
          position = "0, -438";
          halign = "center";
          valign = "center";
        }
      ];

      background = [
        {
          path = "${config.stylix.image}";
          blur_passes = 2;
          blur_size = 3;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 30";
          outline_thickness = 0;
          dots_size = 0.25;
          dots_spacing = 0.55;
          dots_center = true;
          outer_color = "rgb(${config.lib.stylix.colors.base03})";
          inner_color = "rgb(${config.lib.stylix.colors.base00})";
          font_color = "rgb(${config.lib.stylix.colors.base05})";
          fail_color = "rgb(${config.lib.stylix.colors.base08})";
          check_color = "rgb(${config.lib.stylix.colors.base0A})";
          fade_on_empty = false;
          placeholder_text = "";
          hide_input = false;
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -468";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
  stylix.targets.hyprlock.enable = false;
}