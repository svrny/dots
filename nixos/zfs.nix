{ config, pkgs, ... }: {
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "f54723dd";
  boot.zfs.devNodes = "/dev/disk/by-id";
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  swapDevices = [{
    device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_250GB_S4EUNX0R712008Z-part4";
    randomEncryption.enable = true;
  }];

  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot/efis/nvme-Samsung_SSD_970_EVO_Plus_250GB_S4EUNX0R712008Z-part1";
    };
    generationsDir.copyKernels = true;
    grub = {
      efiInstallAsRemovable = true;
      enable = true;
      version = 2;
      copyKernels = true;
      efiSupport = true;
      zfsSupport = true;
      # for systemd-autofs
      extraPrepareConfig = ''
        mkdir -p /boot/efis
        for i in  /boot/efis/*; do mount $i ; done
      '';
      extraInstallCommands = ''
        export ESP_MIRROR=$(mktemp -d -p /tmp)
        cp -r /boot/efis/nvme-Samsung_SSD_970_EVO_Plus_250GB_S4EUNX0R712008Z-part1/EFI $ESP_MIRROR
        for i in /boot/efis/*; do
         cp -r $ESP_MIRROR/EFI $i
        done
        rm -rf $ESP_MIRROR
      '';
      devices = [ "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_250GB_S4EUNX0R712008Z" ];
    };
  };

  systemd.services.zfs-mount.enable = false;
  environment.etc."machine-id".source = "/state/etc/machine-id";
  environment.etc."zfs/zpool.cache".source = "/state/etc/zfs/zpool.cache";
}
