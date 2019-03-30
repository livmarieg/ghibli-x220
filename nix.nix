{ config, lib, pkgs, ... }:

{
  nix = {
    maxJobs = lib.mkDefault 4; # change to number of total cores; lscpu
  };
}
