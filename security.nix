{ config, pkgs, lib, ...}:

{ 
  security = {
    sudo.enable = true;
    apparmor.enable = true;
    audit.enable = true;
    auditd.enable = true;
    dhparams = {
      enable = true;
      stateful = true;
    };
    hideProcessInformation = true;
    polkit.enable = true;
    rngd.enable = true;
    rtkit.enable = true;
  };
}
