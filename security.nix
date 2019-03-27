{ config, pkgs, lib, ...}:

{ 
  security = {
    rtkit.enable = true;
  };
}
