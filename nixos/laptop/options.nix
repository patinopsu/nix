{ lib, ... }:

{
  options.paths.dotfiles = lib.mkOption {
    type = lib.types.str;
    description = "Absolute path to my dotfiles directory";
  };

  config.paths.dotfiles = "/home/patin/dotfiles";
}