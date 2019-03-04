{ config, lib, pkgs, ... }:

{
  networking = {
    dhcpcd.enable = true;
    dnsExtensionMechanism = true;
    enableIPv6 = true;
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 53 67 68 80 443 ];
      allowedUDPPorts = [ 22 53 67 68 80 433 ];
      checkReversePath = true;
      logRefusedConnections = true;
      logRefusedUnicastsOnly = true;
    };
    hostName = "annet-x220";
    nameservers = [ "1.1.1.1" ];
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        scanRandMacAddress = true;
      };
    };
    usePredictableInterfaceNames = true;
    #wireguard.interfaces.wg0 = {
    #  allowIPsAsRoutes = true;
    #  ips = [ "" ];
    #  listenPort = null;
    #  peers = [
    #    { allowedIPs = [ "" ];
    #      endpoint = "";
    #      publicKey = "";}
    #  ];
    #  privateKeyFile = "";
    #};
    wireless.enable = false;
  };
}
