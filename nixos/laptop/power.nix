{ pkgs, ...}:

let
  hibernateDelay = "3600";
in

{
  services = {
    upower.enable = true;
    throttled = {
      enable = true;
      extraConfig = ''
        [GENERAL]
        # Enable or disable that the settings are applied
        Enabled: True
        # Path to the file that indicates whether the system is on AC or battery
        Sysfs_Power_Path: /sys/class/power_supply/AC/online

        [BATTERY]
        # Update interval in seconds
        Update_Rate_s: 30
        # Power limits in Watts
        PL1_TDP_W: 15
        PL1_Duration_s: 28
        PL2_TDP_W: 22
        PL2_Duration_S: 0.002
        # Temperature threshold in Celsius
        Trip_Temp_C: 85

        [AC]
        # Update interval in seconds
        Update_Rate_s: 5
        # Power limits in Watts
        PL1_TDP_W: 25
        PL1_Duration_s: 28
        PL2_TDP_W: 44
        PL2_Duration_S: 0.002
        # Temperature threshold in Celsius
        Trip_Temp_C: 95
      '';
    };
    tuned = {
      enable = true;
    };
    tlp = {
      enable = false;
    };
    logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked= "suspend";
      HibernateDelaySec = "${hibernateDelay}";
    };
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=${hibernateDelay}
  '';
}