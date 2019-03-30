{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7f0c054f-3cdc-4e46-8716-5b8a20b217f0";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/5A00-F9A8";
      fsType = "vfat";
    };
  };
}
