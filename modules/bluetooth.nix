{ config, lib, pkgs, ... }:

{
  options = {
    sys.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth Support";
  };
  config = lib.mkIf config.sys.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
    };
    services = {
      blueman.enable = true;
    };
    services.pipewire.wireplumber = {
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
    systemd.user.services.mpris-proxy = {
      description = "Enable media key controls from Bluetooth devices";
      after = [ "network.target" "sound.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}