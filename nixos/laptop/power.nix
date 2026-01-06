{ pkgs, ...}:

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
      settings = {
        "TLP_ENABLE" = "1";

        CPU_ENERGY_PERF_POLICY_ON_AC = ""; # To make throttled work properly
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balanced_power";

        CPU_BOOST_ON_AC = "1";
        CPU_BOOST_ON_BAT = "1";

        CPU_HWP_DYN_BOOST_ON_AC = "1";
        CPU_HWP_DYN_BOOST_ON_BAT = "0";
  
        RESTORE_DEVICE_STATE_ON_STARTUP = "1";

        "START_CHARGE_THRESH_BAT0" = "80";
        "STOP_CHARGE_THRESH_BAT0" = "97";

        "PLATFORM_PROFILE_ON_AC" = "performance";
        "PLATFORM_PROFILE_ON_BAT" = "balanced";

        PCIE_ASPM_ON_BAT = "powersupersave";
        
        "MEM_SLEEP_ON_AC" = "s2idle";
        "MEM_SLEEP_ON_BAT" = "deep";
        
      };
    };
  };
}