{ pkgs, inputs, ... }:

{
  users.users.patin = {
    description = "Patin Muangjan";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
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
        ./home/hypridle.nix
        ./home/hyprlock.nix
        ./home/extra.nix
        inputs.noctalia.homeModules.default
      ];
    };
  };
}