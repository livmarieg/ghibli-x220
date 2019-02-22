{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./hardware-configuration.nix 
    ./network.nix
    ./packages.nix
    ./services.nix
  ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    #consoleKeyMap = "us";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Chicago";

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      defaultFonts = {
        monospace = ["Fira Mono"];
        sansSerif = ["Fira Sans"];
      };
      ultimate.enable = true;
    };
    fonts = with pkgs; [
      fira-code
      fira-mono
      font-droid
      font-awesome_5
    ];
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "1";
    };
  };

  users = {
    extraUsers = {
      cvoges12 = {
        description = "Clayton Voges";
        createHome = true;
        home = "/home/cvoges12";
        isNormalUser = true;
        uid = 1000;
        extraGroups = [
          "wheel" "disk" "audio" "video"
          "networkmanager" "systemd-journal"
          "libvirtd"
        ];
        shell = pkgs.zsh;
      };
    };
    defaultUserShell = "/run/current-system/sw/bin/zsh";
  };

  system.stateVersion = "18.09";
}
