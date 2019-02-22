{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "annet-x220";
    networkmanager.enable = true;
    firewall = {
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      enable = false;
    };
  };
}
