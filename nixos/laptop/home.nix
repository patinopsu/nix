{ config, lib, pkgs, inputs, ... }:

{
  home.username = "patin";
  home.homeDirectory = "/home/patin";

  services = {
    hypridle.enable = true;
    udiskie.enable = true;
    flameshot = {
      enable = true;
      settings = {
        General = {
          useGrimAdapter = true;
          disabledGrimWarning = true;
        };
      };
    };
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
      shellAliases = {
        nixupdate = "sudo nixos-rebuild switch --flake ~/dotfiles/nixos#laptop --impure";
      };
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    font.name = "Noto Sans";
  };
  home.file.".config/kitty".source = ../../kitty;
  home.file.".config/hypr".source = ../../hypr;
  home.file."scripts".source = ../../scripts;
  home.file.".config/noctalia" = {
      source = ../../noctalia;
      recursive = true;
  };
  home.file.".config/noctalia/plugins" = {
      source = inputs.noctalia-plugins;
      recursive = true;
  };
  home.packages = with pkgs; [
    google-chrome
    neovim
    bat
    xwayland-satellite
    s-tui
    pavucontrol
    ddcutil
    fastfetch
    btop
    kitty
    libnotify
    scrcpy
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    lazygit
  ];
  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
  home.stateVersion = "25.11";
}