{ pkgs, ... }:

{
  services = {
    udisks2.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    
  };
  programs = {
    gpu-screen-recorder.enable = true;
    _1password.enable = true;
    _1password-gui.enable = true;
    _1password-gui.polkitPolicyOwners = [ "patin" ];
  };
  environment.systemPackages = with pkgs; [
    sbctl
    tpm2-tss
    mesa-demos
    vulkan-tools
    distrobox
    swtpm
    gparted
    cachix
    dnsmasq
    android-tools
    gpu-screen-recorder
    gpu-screen-recorder-gtk
  ];
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
    ];
  };
}