{ config, pkgs, lib, ...}:

{
  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };
}
