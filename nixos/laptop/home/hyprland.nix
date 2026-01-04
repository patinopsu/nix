{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    portalPackage = null;
    settings = {
      monitor = [
        ", highres, auto, 1"
        "eDP-1, highres, auto, 1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "noctalia-shell ipc call launcher toggle";
      "$browser" = "google-chrome-stable";
      "$mainMod" = "SUPER";

      "exec-once" = [
        "noctalia-shell"
      ];

      # Env
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = true;
        layout = "scrolling";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };


        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      
      misc = {
        disable_watchdog_warning = true;
        "vfr" = "true";
      };

      animations = {
        enabled = "yes";
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      plugin = {
        hyprscrolling = {
          column_width = 0.7;
          fullscreen_on_one_column = false;
        };
      };

      input = {
        kb_layout = "us,th";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 0;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          tap-to-click = true;
          natural_scroll = true;
          scroll_factor = 0.1;
        };
      };

      device = [
        {
          name = "tpps/2-elan-trackpoint";
          sensitivity = 0.5;
          accel_profile = "flat";
          scroll_factor = 0.2;
        }
        {
          name = "synps/2-synaptics-touchpad";
          sensitivity = 0.5;
        }
      ];

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, V, exec, noctalia-shell ipc call launcher clipboard"
        "$mainMod, E, exec, $fileManager"
        "Alt, Space, exec, $menu"

        "$mainMod, L, exec, hyprlock"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod SHIFT, left, layoutmsg, movewindowto r"
        "$mainMod SHIFT, right, layoutmsg, movewindowto l"
      ];

      bindl = [
        ", XF86AudioNext, exec, noctalia-shell ipc call media next"
        ", XF86AudioPause, exec, noctalia-shell ipc call media pause"
        ", XF86AudioPlay, exec, noctalia-shell ipc call media play"
        ", XF86AudioPrev, exec, noctalia-shell ipc call media previous"

        ",XF86AudioRaiseVolume, exec, noctalia-shell ipc call volume increase"
        ",XF86AudioLowerVolume, exec, noctalia-shell ipc call volume decrease"
        ",XF86AudioMute, exec, noctalia-shell ipc call volume muteOutput"
        ",XF86AudioMicMute, exec, noctalia-shell ipc call volume muteInput"
        ",XF86MonBrightnessUp, exec, noctalia-shell ipc call brightness increase"
        ",XF86MonBrightnessDown, exec, noctalia-shell ipc call brightness decrease"

        ",XF86WLAN, exec, noctalia-shell ipc call wifi toggle"
        ",XF86NotificationCenter, exec, noctalia-shell ipc call notifications toggleHistory"
        ",XF86Display, exec, notify-send -a \"System Messages\" \"Huh, seems like Hyprland didn't have this function implemented afterall 🫤\""

        ",XF86Favorites, exec, noctalia-shell ipc call launcher toggle"
        ",XF86PickupPhone, exec, $terminal"
        ",XF86HangupPhone, exec, $browser"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "match:class org.freedesktop.impl.portal.desktop.kde, float on"
        "match:class udiskie, float on"
      ];
    };
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
    ];
  };
}