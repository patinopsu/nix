{ config, lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
  };
  services.pipewire.wireplumber = {
    enable = true;
  };
  systemd.user.services.mpris-proxy = {
    description = "Enable media key controls from Bluetooth devices";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
