{ config, lib, pkgs, inputs, ... }:

{
  home.username = "patin";
  home.homeDirectory = "/home/patin";


  services = {
    hypridle.enable = true;
    udiskie.enable = true;
  };
  programs = {
    git = {
      enable = true;
      settings = {
        gpg = {
          format = "ssh";
        };
        user = {
          name  = "Patin Muangjan";
          email = "patin@patin.dev";
        };
        "gpg \"ssh\"" = {
          program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
        };
        commit = {
          gpgsign = true;
        };
        user = {
          signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILO0F9jC5uBccmMoBN71OR0zNjl8sKCYjZAEN/qKsSkN";
        };
      };
    };
  ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        extraOptions = {
          "IdentityAgent" = "~/.1password/agent.sock";
        };
      };
    };
  };
  zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
        ];
      };
      initContent = ''
        if uwsm check may-start; then
          echo Starting Hyprland
          exec uwsm start default
        fi  
      '';
      shellAliases = {
        nixupdate = "sudo nixos-rebuild switch --flake ~/dotfiles/nixos#laptop --impure";
        screenfix = "~/scripts/monitor-handle.sh init";
	      hyprinit = "uwsm start default";
        garbagecollect = "sudo nix-collect-garbage -d && nixupdate";
      };
    };
  };
  home.file.".config/kitty".source = ../../../kitty;
  home.file."scripts".source = ../../../scripts;
  home.packages = with pkgs; [
    bat
    neovim
    s-tui
    lazygit
    pavucontrol
    ddcutil
    fastfetch
    btop
    kitty
    libnotify
    scrcpy
    vscode
    google-chrome
  ];
  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
  home.stateVersion = "25.11";
}
