{ pkgs, ... }:

{
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Asia/Bangkok";

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        chrome
        google-chrome
        google-chrome-stable
      '';
    };
    "/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };
}
