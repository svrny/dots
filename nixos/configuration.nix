{config, lib, pkgs, home-manager, ... }:

{
  environment.defaultPackages = [ ];
  services.xserver.desktopManager.xterm.enable = false;

  nix = {
    #gc = {
    #  automatic = true;
    #  dates = "weekly";
    #};
    #optimise = {
    #  automatic = true;
    #  dates = [ "weekly" ];
    #};
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };
    initrd.kernelModules = [ "fuse" "amdgpu" ];
    cleanTmpDir = true;
    #kernelPackages = pkgs.linuxPackages_zen;
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    sudo.enable = true;
    protectKernelImage = true;
    unprivilegedUsernsClone = true;
    rtkit.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.dbus.enable = true;

  users.users.qlixior = {
    description = "Qlixior";
    isNormalUser = true;
    createHome = true;
    home = "/home/qlixior";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" "adbusers" ];
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  #systemd.services = {
  #  create-swapfile = {
  #    serviceConfig.Type = "oneshot";
  #    wantedBy = [ "swap-swapfile.swap" ];
  #    script = ''
  #      ${pkgs.coreutils}/bin/truncate -s 0 /swap/swapfile
  #      ${pkgs.e2fsprogs}/bin/chattr +C /swap/swapfile
  #      ${pkgs.btrfs-progs}/bin/btrfs property set /swap/swapfile compression none
  #    '';
  #  };
  #};

  system.stateVersion = "22.11";
}
