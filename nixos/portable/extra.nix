{ pkgs, ... }:

{
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Bangkok";

  environment.etc = {
    "/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
