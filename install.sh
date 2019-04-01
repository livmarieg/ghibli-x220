encryptPart(){
  pv=$1
  fs=$2
  cryptsetup luksFormat $fs
  cryptsetup luksOpen $fs $pv
}
formatDisk(){
  table=$1
  disk=$2
  parted $disk --script mklabel $table
  sgdisk -og $disk
  sgdisk -n 1:0:500M -c 1:"EFI" -t 1:ef00 -g $disk
  sgdisk -n 3:0:0 -c 3:"LVM" -t 3:8301 -g $disk
}
fsSetup(){
  mkfs.vfat -n EFI /dev/sda1
  mkfs.ext4 -L root /dev/vg/root
  mkswap -L swap /dev/vg/swap
  mount /dev/vg/root /mnt
  mkdir /mnt/boot
  mount /dev/sda1 /mnt/boot
  swapon /dev/vg/swap
}
lvmSetup(){
  PV = $1
  VG = $2
  pvcreate /dev/mapper/enc-pv
  vgcreate vg /dev/mapper/enc-pv
  lvcreate -n swap vg -L 8G
  lvcreate -n root vg -l 100%FREE
}
curlConfig(){
  mkdir /mnt/etc
  mkdir /mnt/etc/nixos
  cd /mnt/etc/nixos
  curl https://0x0.st/zPQi.nix > boot.nix
  curl https://0x0.st/zPa4.nix > configuration.nix
  curl https://0x0.st/zoEN.nix > docs.nix
  curl https://0x0.st/zPQo.nix > environment.nix
  curl https://0x0.st/zPQH.nix > fileSystems.nix
  curl https://0x0.st/zPaw.nix > fonts.nix
  curl https://0x0.st/zPax.nix > hardware.nix
  curl https://0x0.st/zPQX.nix > home.nix
  curl https://0x0.st/zPaY.nix > i18n.nix
  curl https://0x0.st/zPag.nix > networking.nix
  curl https://0x0.st/zPaE.nix > nix.nix
  curl https://0x0.st/zPQ8.nix > nvim.nix
  curl https://0x0.st/zPal.nix > programs.nix
  curl https://0x0.st/zPa0.nix > security.nix
  curl https://0x0.st/zPQP.nix > services.nix
  curl https://0x0.st/zoEh.nix > sound.nix
  curl https://0x0.st/zPQZ.nix > swapDevices.nix
  curl https://0x0.st/zo6r.nix > systemd.nix
  curl https://0x0.st/zo6s.nix > time.nix
  curl https://0x0.st/zPQN.nix > users.nix
  curl https://0x0.st/zo6i.nix > xdg.nix
  mkdir common
  curl https://0x0.st/zPan.nix > common/boot.nix
  curl https://0x0.st/zPa5.nix > common/environment.nix
  curl https://0x0.st/zPaR.nix > common/hardware.nix
  curl https://0x0.st/zPa7.nix > common/i18n.nix
  curl https://0x0.st/zPah.nix > common/networking.nix
  curl https://0x0.st/zPBr.nix > common/nix.nix
  curl https://0x0.st/zoE1.nix > common/nipkgs.nix
  curl https://0x0.st/zoEk.nix > common/powerManagement.nix
  curl https://0x0.st/zPBz.nix > common/programs.nix
  curl https://0x0.st/zPBi.nix > common/security.nix
  curl https://0x0.st/zPBo.nix > common/services.nix
  curl https://0x0.st/zoEC.nix > common/system.nix
  curl https://0x0.st/zPBH.nix > common/users.nix
}

formatDisk "gpt" "/dev/sda"
encryptPart "enc-pv" "/dev/sda2"
lvmSetup "vg" "/dev/mapper/enc-pv"
fsSetup
curlConfig
