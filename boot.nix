{ config, lib, pkgs, ... }:

{
  boot = { 
    enableContainers = true;
    hardwareScan = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    initrd = { 
      checkJournalingFS = true;
      luks = {
        devices = [
          { name = "root";
            device = "/dev/disk/by-uuid/39dbf466-ebe0-47b9-ac66-9a1dd1cb72bf";
            preLVM = true;}
        ];
        mitigateDMAAttacks = true;
        reusePassphrases = true;
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
