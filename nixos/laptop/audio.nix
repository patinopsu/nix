{ pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
    };
  };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.min-quantum" = 1024;
        };
      };
      
      wireplumber = {
        enable = true;
        extraConfig."10-bluez-policy" = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
        };
        extraConfig."11-bluez-config" = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;

          };
        };
      };
    };
  };

  systemd.user.services.mpris-proxy = {
    description = "Enable media key controls from Bluetooth devices";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}