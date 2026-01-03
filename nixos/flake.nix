{
  description = "Not so simple, IDIOT";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-plugins = {
      url = "github:noctalia-dev/noctalia-plugins?submodules=1";
      flake = false;
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, lanzaboote, stylix, ... }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./laptop/import.nix
        inputs.stylix.nixosModules.stylix
        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen1
      ];
    };
  };
}
