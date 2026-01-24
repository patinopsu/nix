{ inputs, pkgs, ... }:

{
  services.hyprshell = {
    enable = true;
    package = inputs.hyprshell.packages.${pkgs.stdenv.hostPlatform.system}.hyprshell-slim;
    settings = {
      windows = {
        scale = 8.5;
        items_per_row = 5;
        switch = {
          modifier = "alt";
          filter_by = [
            "current_monitor"
          ];
          switch_workspaces = false;        
        };   
      };
    };
  };
  xdg.configFile."hyprshell/styles.css".text = ''
    :root {
        --border-color: rgba(90, 90, 120, 0.4);
        --border-color-active: rgba(239, 9, 9, 0.9);

        --bg-color: rgba(20, 20, 20, 0.7);
        --bg-color-hover: rgba(40, 40, 50, 1);

        --border-radius: 12px;
        --border-size: 3px;
        --border-style: solid;

        --text-color: rgba(245, 245, 245, 1);

        --window-padding: 2px;
    }
  '';
}

