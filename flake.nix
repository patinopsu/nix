{
  description = "Not so simple, IDIOT";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, lanzaboote, stylix, arkenfox, ... }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./laptop/boot.nix
        ./laptop/gui.nix
        ./laptop/network.nix
        ./laptop/theming.nix
        ./laptop/users.nix
        ./laptop/extra.nix
        ./laptop/displayManager.nix
        ./laptop/power.nix
        ./laptop/security.nix
        ./laptop/bluetooth.nix
        ./laptop/packages.nix
        ./laptop/audio.nix
        ./laptop/printing.nix
        ./laptop/virtualization.nix
        ./laptop/hardware.nix
        inputs.stylix.nixosModules.stylix
        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen1
      ];
    };
    nixosConfigurations.portable = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./portable/boot.nix
        ./portable/extra.nix
        ./portable/gui.nix
        ./portable/network.nix
        ./portable/packages.nix
        ./portable/security.nix
        ./portable/hardware.nix
        ./portable/theming.nix
        ./portable/user.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
