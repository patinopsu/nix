{ config, lib, pkgs, inputs, ... }:

{
  users.users.patin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "i2c" "lp" "scanner" "input" "libvirtd" "adbusers" ];
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
        ./home/neovim.nix
        ./home/kitty.nix
        ./home/noctalia.nix
        ./home/hyprland.nix
        ./home/hyprpaper.nix
        ./home/hypridle.nix
        ./home/hyprlock.nix
        ./home/extra.nix
        inputs.noctalia.homeModules.default
      ];
    };
  };
}
