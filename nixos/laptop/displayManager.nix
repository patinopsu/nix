{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "colormix";
      battery_id = "BAT0";
      bigclock = "en";
      box_title = "Patin's ThinkPad T14 Gen 1";
      brightness_down_key = "";
      brightness_up_key = "";
      clock = "%c";
      edge_margin = "1";
    };
  };
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
}