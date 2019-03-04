{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };
}
