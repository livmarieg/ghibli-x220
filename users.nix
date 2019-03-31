{ config, lib, pkgs, ... }:

{
  users = {
    extraUsers = {
      livmarieg = {
        description = "Olivia Gailey";
        createHome = true;
        home = "/home/livmarieg";
        isNormalUser = true;
        uid = 1000;
        extraGroups = [
          "wheel" "disk" "audio" "video"
          "networkmanager" "systemd-journal"
          "libvirtd" "taskd"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
      };
    };
  };
}
