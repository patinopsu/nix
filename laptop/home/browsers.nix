{ config, pkgs, inputs, ... }:

{
  config = {
    stylix.targets.firefox = {
      profileNames = [ "main" ];
      colorTheme.enable = true;
      firefoxGnomeTheme.enable = true;
    };
    programs.firefox = {
      enable = true;
      arkenfox.enable = true;
      profiles = {
        main = {
          extensions.force = true;
          arkenfox = {
            enable = true;
            enableAllSections = true;
            "4500" = {
              "4501"."privacy.resistFingerprinting".value = false;
            };
            "2800" = {
              "2812"."privacy.clearOnShutdown_v2.browsingHistoryAndDownloads".value = false;
              "2815"."privacy.clearOnShutdown_v2.cookiesAndStorage".value = false;
            };
          };
        };
      };
    };
  };
}