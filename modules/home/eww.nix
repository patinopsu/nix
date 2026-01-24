{
  programs.eww = {
    enable = true;
  };

  # Must be an absolute path my ass
  xdg.configFile."eww/eww.yuck".text = builtins.readFile ../../src/extcfg/eww/eww.yuck;
  xdg.configFile."eww/eww.scss".text = builtins.readFile ../../src/extcfg/eww/eww.scss;
}