{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./hardware-configuration.nix 
    ./network.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];

  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Chicago";

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      allowBitmaps = true;
      antialias = true;
      hinting.enable = true;
      includeUserConf = true;
      penultimate.enable = true;
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

  system.stateVersion = "18.09";
}
