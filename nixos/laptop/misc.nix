{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  hardware.bluetooth.enable = true;
  services.tuned.enable = true;
  services.tlp.enable = false;
  services.upower.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  time.timeZone = "Asia/Bangkok";
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

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
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerd-fonts.fira-code
    ];
  };
  environment.systemPackages = with pkgs; [
    sbctl
    tpm2-tss
    mesa-demos
    vulkan-tools
  ];

  programs.nix-ld.enable = true;
  programs.gpu-screen-recorder.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "patin" ];
  };
  xdg.menus.enable = true;
  xdg.mime.enable = true;
  system.stateVersion = "25.11";
}
