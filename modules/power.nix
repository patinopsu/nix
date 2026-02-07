{ pkgs, ...}:

let
  hibernateDelay = "5400";
in

{
  services = {
    upower.enable = true;
    throttled = {
      enable = true;
      };
      tuned = {
        enable = true;
      };
      tlp = {
        enable = false;
      };
      logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
        HandleLidSwitchDocked = "suspend";
        HibernateDelaySec = "${hibernateDelay}";
      };
    };
    systemd.sleep.extraConfig = ''
      HibernateDelaySec=${hibernateDelay}
    '';
}
