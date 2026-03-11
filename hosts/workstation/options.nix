{ config, lib, pkgs, ... }:

{
  networking.hostName = "daytona";
  home-manager.users.${config.globalvars.username}.programs.zsh.shellAliases = { nrb = "sudo nixos-rebuild switch --flake ~/nixos#workstation --impure"; };

  globalvars.efiuuid = "3FD8-A235";
  globalvars.bootuuid = "1e7b7029-fe58-4171-8c6d-f9c4e6aedc78";
  globalvars.rootuuid = "2eebacb3-7e4c-448d-9147-b66a9b5c3b28";

  steam.enable = true;
  ananicy-cpp.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
}
