{ config, lib, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    fprintd.enable = true;
    redshift = {
      enable = true;
      latitude = "38.6";
      longitude = "90.5";
      temperature = {
        day = 3500;
        night = 5500;
      };
      brightness = {
        day = "1";
        night = "1";
      };
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "colemak";
      libinput = {
        enable = true;
        tapping = false;
      };
      #xrandrHeads = [
      #  { output = "LVDS1";
      #    primary = true;
      #    monitorConfig = ''
      #      DisplaySize 1366 768
      #    '';
      #  }
      #  { output = "VGA1";
      #    primary = false;
      #    monitorConfig = ''
      #      DisplaySize 1920 1080
      #    '';
      #  }
      #];
      synaptics.enable = false;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          extraPackages = haskellPackages: [
            haskellPackages.xmonad-contrib
            haskellPackages.xmonad-extras
            haskellPackages.xmonad
            haskellPackages.monad-logger
          ];
        };
        default = "i3";
      };
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "0 0 1 * *     root     tmpwatch -maf 240 /tmp"
        "30 3 * * *    root     nix-store --optimize"
      ];
    };
    udev.packages = with pkgs; [
      android-udev-rules
    ];
    nixosManual.showManual = true;
    upower.enable = true;
  };
  nix = {
    gc.automatic = true;
    gc.dates = "3:00";
  };
}
