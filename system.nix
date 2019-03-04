{ config, lib, pkgs, ... }:

{
  system = {
    stateVersion = "18.09";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-18.09/";
    };
  };
}
