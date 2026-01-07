{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "eza"
          "zoxide"
          "fzf"
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