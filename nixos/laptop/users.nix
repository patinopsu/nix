{ config, lib, pkgs, inputs, ... }:

{
  users.users.patin = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "docker" "i2c"];
    description = "Patin Muangjan";
    shell = pkgs.zsh;
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.patin = {
      imports = [
        ./home/git.nix
        ./home/ssh.nix
        ./home/zsh.nix
        ./home/fuzzel.nix
        ./home/kitty.nix
        ./home/waybar.nix
        ./home/hyprland.nix
        ./home/hypridle.nix
        ./home/hyprlock.nix
        ./home/extra.nix
      ];
    };
  };
  security = {
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
        Defaults insults
        Defaults passprompt="🔒password for %p: "
        Defaults badpass_message="❌Incorrect Passowrd. Please try again."
      '';
    };
  };
}
