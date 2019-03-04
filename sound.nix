{ config, lib, pkgs, ... }:

{
  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "1";
    };
  };
}
