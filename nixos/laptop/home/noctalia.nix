{ inputs, config, pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 32;
      appLauncher = {
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipPreview = true;
        enableClipboardHistory = true;
        iconMode = "tabler";
        position = "center";
        showCategories = false;
        sortByMostUsed = true;
        terminalCommand = "kitty";
        useApp2Unit = false;
        viewMode = "list";
      };

      audio = {
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        mprisBlacklist = [];
        preferredPlayer = "";
        visualizerType = "linear";
        volumeOverdrive = true;
        volumeStep = 5;
      };

      bar = {
        density = "default";
        exclusive = true;
        floating = true;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        monitors = [];
        outerCorners = true;
        position = "top";
        showCapsule = true;
        showOutline = false;
        transparent = true;
        widgets = {
          center = [
            {
              customFont = "";
              formatHorizontal = "MMM d | h:mm AP";
              formatVertical = "";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = false;
            }
          ];
          left = [
            {
              characterCount = 2;
              colorizeIcons = false;
              enableScrollWheel = true;
              followFocusedScreen = false;
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
              showApplications = false;
              showLabelsOnlyWhenOccupied = true;
            }
            {
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "settings";
              id = "ControlCenter";
              useDistroLogo = false;
            }
            {
              colorizeIcons = false;
              hideMode = "visible";
              id = "ActiveWindow";
              maxWidth = 180;
              scrollingMode = "never";
              showIcon = true;
              useFixedWidth = false;
            }
            {
              blacklist = [];
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
              id = "Tray";
            }
          ];
          right = [
            {
              displayMode = "onhover";
              id = "WiFi";
            }
            {
              displayMode = "onhover";
              id = "Volume";
            }
            {
              displayMode = "forceOpen";
              id = "KeyboardLayout";
            }
            {
              deviceNativePath = "";
              displayMode = "alwaysShow";
              hideIfNotDetected = true;
              id = "Battery";
              showNoctaliaPerformance = false;
              showPowerProfiles = false;
              warningThreshold = 30;
            }
            {
              id = "plugin:privacy-indicator";
            }
            {
              hideWhenZero = false;
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
            {
              hideMode = "alwaysExpanded";
              icon = "power";
              id = "CustomButton";
              leftClickExec = "noctalia-shell ipc call sessionMenu toggle";
              leftClickUpdateText = false;
              maxTextLength = {
                horizontal = 10;
                vertical = 10;
              };
              middleClickExec = "";
              middleClickUpdateText = false;
              parseJson = false;
              rightClickExec = "";
              rightClickUpdateText = false;
              showIcon = true;
              textCollapse = "";
              textCommand = "";
              textIntervalMs = 3000;
              textStream = false;
              wheelDownExec = "";
              wheelDownUpdateText = false;
              wheelExec = "";
              wheelMode = "unified";
              wheelUpExec = "";
              wheelUpUpdateText = false;
              wheelUpdateText = false;
            }
          ];
        };
      };

      brightness = {
        brightnessStep = 5;
        enableDdcSupport = true;
        enforceMinimum = true;
      };

      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "timer-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };

      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {id = "PowerProfile";}
            {id = "Bluetooth";}
          ];
          right = [
            {id = "KeepAwake";}
            {id = "NightLight";}
          ];
        };
      };

      dock = {
        animationSpeed = 1;
        colorizeIcons = false;
        deadOpacity = 0.44;
        displayMode = "always_visible";
        enabled = false;
        floatingRatio = 0.54;
        inactiveIndicators = true;
        monitors = [];
        onlySameOutput = true;
        pinnedStatic = false;
        size = 0.93;
      };

      general = {
        allowPanelsOnScreenWithoutBar = true;
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "/home/patin/.face";
        boxRadiusRatio = 1;
        compactLockScreen = false;
        dimmerOpacity = 0.32;
        enableShadows = true;
        forceBlackScreenCorners = false;
        iRadiusRatio = 1;
        language = "";
        lockOnSuspend = false;
        radiusRatio = 1;
        scaleRatio = 0.95;
        screenRadiusRatio = 0;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showHibernateOnLockScreen = true;
        showScreenCorners = false;
        showSessionButtonsOnLockScreen = false;
      };

      hooks = {
        darkModeChange = "";
        enabled = true;
        performanceModeDisabled = "";
        performanceModeEnabled = "";
        screenLock = "";
        screenUnlock = "";
        wallpaperChange = "";
      };

      location = {
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        name = "Samut Prakan, TH";
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = false;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
        weatherShowEffects = true;
      };

      nightLight = {
        autoSchedule = true;
        dayTemp = "6500";
        enabled = true;
        forced = false;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        nightTemp = "4000";
      };

      notifications = {
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        enabled = true;
        location = "bottom_right";
        lowUrgencyDuration = 3;
        monitors = [];
        normalUrgencyDuration = 8;
        overlayLayer = true;
        respectExpireTimeout = false;
        sounds = {
          criticalSoundFile = "";
          enabled = true;
          excludedApps = "discord,firefox,chrome,chromium,edge";
          lowSoundFile = "";
          normalSoundFile = "";
          separateSounds = false;
          volume = 0.40;
        };
      };

      osd = {
        autoHideMs = 2000;
        enabled = true;
        enabledTypes = [0 1 2 4 3];
        location = "bottom";
        monitors = [];
        overlayLayer = true;
      };

      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "/home/patin/Videos";
        frameRate = 60;
        quality = "very_high";
        showCursor = true;
        videoCodec = "h264";
        videoSource = "screen";
      };

      sessionMenu = {
        countdownDuration = 10000;
        enableCountdown = true;
        largeButtonsStyle = true;
        position = "center";
        powerOptions = [
          {
            action = "lock";
            command = "hyprlock";
            countdownEnabled = false;
            enabled = true;
          }
          {
            action = "suspend";
            command = "";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "hibernate";
            command = "";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "reboot";
            command = "";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "logout";
            command = "loginctl terminate-user \"\"";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "shutdown";
            command = "";
            countdownEnabled = true;
            enabled = true;
          }
        ];
        showHeader = true;
      };

      ui = {
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        fontDefault = "${config.stylix.fonts.sansSerif.name}";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        tooltipsEnabled = true;
        wifiDetailsViewMode = "grid";
      };

      wallpaper = {
        enabled = false;
      };
    };
    plugins = {
      version = 1;
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        screen-recorder = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
    };
  };
  stylix.targets.noctalia-shell.enable = true;
}