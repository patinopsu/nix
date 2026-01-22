{ inputs, pkgs, ... }:

{
  services.hyprshell = {
    enable = true;
    package = inputs.hyprshell.packages.${pkgs.system}.hyprshell-slim;

  };
}

