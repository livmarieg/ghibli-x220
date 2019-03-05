{ config, lib, pkgs, ... }:

{
  nix = {
    checkConfig = true;
    gc = {
      automatic = true;
      dates = "3:00";
    };
    maxJobs = lib.mkDefault 4; # change to number of total cores; lscpu
    optimise = {
      automatic = true;
      dates = [ "3:30" ];
    };
    readOnlyStore = true;
    requireSignedBinaryCaches = true;
    useSandbox = true;
  };
}
