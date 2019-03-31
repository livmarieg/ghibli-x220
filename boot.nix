{ config, lib, pkgs, ... }:

{
  boot = { 
    kernelModules = [ "kvm-intel" ];
    initrd = { 
      checkJournalingFS = true;
      luks = {
        devices = [
          { name = "root";
            device = "/dev/disk/by-uuid/4bab2d22-1c1d-4c7a-8193-b8e12f542dce";
            preLVM = true;}
        ];
      };
      availableKernelModules = [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
    };
    loader = {
      systemd-boot = {
        enable = true;
        editor = true;
      };
      grub.enable = false;
      efi.canTouchEfiVariables = true;
    };
  };
}
