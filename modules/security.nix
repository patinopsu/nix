{ lib, pkgs, ... }:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
        Defaults passprompt="🔒password for %p: "
        Defaults badpass_message="❌Incorrect Password. Please try again."
      '';
    };
  };
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "GMOME Authentication Agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };
}
