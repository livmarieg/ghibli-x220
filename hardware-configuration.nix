{ config, lib, pkgs, ... }:

{
  imports = [ 
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7f0c054f-3cdc-4e46-8716-5b8a20b217f0";
    fsType = "ext4";
    options = [ "noatime" "nodiratime" "discard" ];
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/5A00-F9A8";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/62710d48-c6b4-465c-9a43-210a22f1bc60"; }
  ];

  nix.maxJobs = lib.mkDefault 4; # change to number of total cores; lscpu
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "powersave";
    powertop.enable = true;
  };
  hardware = {
    bluetooth = {
      enable = false;
      #package = pkgs.blue;
      powerOnBoot = false;
    };
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      s3tcSupport = true;
      enable = true;
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
}
