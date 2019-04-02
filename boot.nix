{ config, lib, pkgs, ... }:

{
  boot = { 
    kernelModules = [ "kvm-intel" ];
    initrd = { 
      checkJournalingFS = true;
      luks = {
        devices = [
          { name = "root";
            device = "/dev/disk/by-uuid/4316eab2-497d-4b64-ae1d-c512b13d48e2";
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
