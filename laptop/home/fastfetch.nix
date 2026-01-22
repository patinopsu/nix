# ______ ___   _____ ___________ _____ _____ _____  _   _ 
# |  ___/ _ \ /  ___|_   _|  ___|  ___|_   _/  __ \| | | |
# | |_ / /_\ \\ `--.  | | | |_  | |__   | | | /  \/| |_| |
# |  _||  _  | `--. \ | | |  _| |  __|  | | | |    |  _  |
# | |  | | | |/\__/ / | | | |   | |___  | | | \__/\| | | |
# \_|  \_| |_/\____/  \_/ \_|   \____/  \_/  \____/\_| |_/
#  Inspired by Bina

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = null;
      display = {
        separator = " › ";
      };
      modules = [
        {
          type = "os";
          key = " ";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "32";
        }
        {
          type = "packages";
          format = "{all} (combined)";
          key = " ";
          keyColor = "33";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "34";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "35";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "36";
        }
        "break"
      ];
    };
  };
}