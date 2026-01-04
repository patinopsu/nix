{
  services = {
    upower.enable = true;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "balance_performance";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";

        RESTORE_DEVICE_STATE_ON_STARTUP = "1";

        "INTEL_GPU_MIN_FREQ_ON_AC" = "300";
        "INTEL_GPU_MIN_FREQ_ON_BAT" = "300";
        "INTEL_GPU_MAX_FREQ_ON_AC" = "1150";
        "INTEL_GPU_MAX_FREQ_ON_BAT" = "1150";
        "INTEL_GPU_BOOST_FREQ_ON_AC" = "1150";
        "INTEL_GPU_BOOST_FREQ_ON_BAT" = "1150";

        "START_CHARGE_THRESH_BAT0" = "80";
        "STOP_CHARGE_THRESH_BAT0" = "97";
      };
    };
  };
}