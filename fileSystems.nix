{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/498a394c-8e3a-4595-bbfd-424332dbfda1";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/3844-0071";
      fsType = "vfat";
    };
  };
}
