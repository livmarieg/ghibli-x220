{ config, lib, pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = false;
      #package = pkgs.blue;
      powerOnBoot = false;
    };
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      s3tcSupport = true;
      enable = true;
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
}
