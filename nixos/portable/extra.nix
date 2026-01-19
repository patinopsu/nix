{ pkgs, ... }:

{
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Bangkok";

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
