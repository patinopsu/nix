{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Asia/Bangkok";

  services = {
    udisks2.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
  };
  
  environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        chrome
        google-chrome
        google-chrome-stable
      '';
    };
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
    ];
  };
  environment.systemPackages = with pkgs; [
    sbctl
    tpm2-tss
    mesa-demos
    vulkan-tools
    pkgs.distrobox
  ];

  programs.nix-ld.enable = true;
  programs.gpu-screen-recorder.enable = true;
  programs._1password.enable = true;
  programs._1password-gui.enable = true;
  xdg.menus.enable = true;
  xdg.mime.enable = true;
  system.stateVersion = "25.11";
}
