{ config, pkgs, lib, ...}:

{ 
  security = {
    sudo.enable = true;
    apparmor.enable = true;
    audit.enable = true;
    auditd.enable = true;
  };
}
