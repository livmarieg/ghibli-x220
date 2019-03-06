Annet x220
==========
**System configuration for nixOS on the x220**

Features
--------
* Network Automation
* Security Automation
* Service Automaton
* User Automation
* Hardware Automation
* Package Automation
* Misc Config Automation

ToDo
----
* wireguard
* ssh
  - public/private key authentication
  - remove password authentication
* quagga
  - ospf
    * v2
    * v3
  - bgp
* taskwarrior
* rsync
* libvirtd
* install script
  - dialog interface
  - variable users
  - variable physical disks
  - variable hardware generation
  - variable cpu cores
  - variable pkg selection
  - variable LVM volumes
  - variable swap/memory
* xmonad
  - colemak bindings
  - xmobar
  - general bindings
* ~~home-manager~~
  - port configs
* vim
  - make each part into a plugin
  - rewrite plugins in haskell
  
Curling
---------
Not all builds will be made from nixOS or a system with the nix package manager. This includes builds that are new installs and deployments that do not contain the git package. Consequently, these modules must be curled for installation. So far, I do not own a private and sufficiently secure domain. In the meantime, I will curl each module to https://0x0.st and will list the links for each below:
* boot.nix - https://0x0.st/zoEP.nix
* configuration.nix - https://0x0.st/zoEZ.nix
* docs.nix - https://0x0.st/zoEN.nix
* env.nix - https://0x0.st/zo6-.nix
* fonts.nix - https://0x0.st/zoEc.nix
* fs.nix - https://0x0.st/zoEA.nix
* home.nix - https://0x0.st/zo6o.nix
* hw.nix - https://0x0.st/zoEB.nix
* i18n.nix - https://0x0.st/zoEM.nix
* net.nix - https://0x0.st/zoES.nix
* nix.nix - https://0x0.st/zoEQ.nix
* nixpkgs.nix - https://0x0.st/zoE1.nix
* nvim.nix - https://0x0.st/zzho.txt
* power.nix - https://0x0.st/zoEk.nix
* programs.nix - https://0x0.st/zoEd.nix
* security.nix - https://0x0.st/zoE5.nix
* services.nix - https://0x0.st/zoE7.nix
* sound.nix - https://0x0.st/zoEh.nix
* swap.nix - https://0x0.st/zoEF.nix
* system.nix - https://0x0.st/zoEC.nix
* systemd.nix - https://0x0.st/zo6r
* time.nix - https://0x0.st/zo6s.nix
* users.nix - https://0x0.st/zo6z.nix
* xdg.nix - https://0x0.st/zo6i.nix
