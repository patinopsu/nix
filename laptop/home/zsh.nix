{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
      enable = true;
        plugins = [
          "git"
          "eza"
          "zoxide"
          "fzf"
        ];
      };
      initContent = ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
      shellAliases = {
        nrb = "sudo nixos-rebuild switch --flake ~/nix#laptop --impure";
        garbagecollect = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/nix#laptop --impure";
        cd = "z";
      };
    };
  programs.atuin = {
    enable = true;
  };
  home.sessionVariables = {
    ZSH_COMPDUMP = "${config.home.homeDirectory}/.cache/zsh/.zcompdump";
  };
}