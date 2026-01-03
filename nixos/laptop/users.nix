{ config, lib, pkgs, inputs, ... }:

{
  users.users.patin = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "docker" "i2c"];
    description = "Patin Muangjan";
    shell = pkgs.zsh;
    #packages = with pkgs; [];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.patin = {
      imports = [
        ./home/main.nix
        ./home/hyprland.nix
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
