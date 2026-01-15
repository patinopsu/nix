{ pkgs, ... }:

{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    ipc = on
    splash = true

    wallpaper {
        monitor = eDP-1
        path = ~/walls/tt2.jpg
        #path = ~/Pictures/lpb.jpg
        fit_mode = cover
    }

    wallpaper {
        monitor =
        #path = ~/walls/tt2.jpg
        path = ~/walls/archivesgov-911-2.JPG
        fit_mode = cover
    }
  '';
  home.packages = with pkgs; [
    hyprpaper
  ];
}