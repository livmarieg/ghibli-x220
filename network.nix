{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "annet-x220";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 53 67 68 80 443 ];
      allowedUDPPorts = [ 22 53 67 68 80 433 ];
    };
  };
}
