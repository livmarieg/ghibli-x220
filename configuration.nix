{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./env.nix
    ./hw.nix 
    ./home.nix
    ./net.nix
    ./nixpkgs.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./users.nix
    (import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz) {}).nixos
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
  
  xdg = {
    autostart.enable = true;
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
  };
  
  systemd.enableEmergencyMode = true;

  system = {
    stateVersion = "18.09";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-18.09/";
    };
  };
}
