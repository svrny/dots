{ config, lib, pkgs, home-manager, ... }: {
  imports = [ ./hardware-configuration-zfs.nix ./zfs.nix ];

  nix.package = pkgs.nixUnstable;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.joypixels.acceptLicense = true;

  environment = {
    defaultPackages = lib.mkForce [ ];
    shells = with pkgs; [ zsh bashInteractive ];
    systemPackages = (with pkgs; [
      # Gui apps
      firefox-wayland gimp libreoffice-fresh
      pavucontrol element-desktop vscode-fhs
      tilix
      # Cli utils
      # duf inotify-tools wget du-dust musikcube
      jq bat htop btop ripgrep zoxide cryptsetup
      fd fzf curl sysz unzip ffmpeg android-tools
      lf git lsd tmux delta neovim killall yt-dlp
      libqalculate alsa-utils procps
      # Dev
      elixir nodejs gcc python310
    ]) ++ (with pkgs.gnome; [
      # Gnome apps
      nautilus totem evince eog file-roller gnome-autoar
      gnome-disk-utility gnome-system-monitor
    ]);
  };

  virtualisation.podman.enable = true;

  fonts = {
    fontconfig.enable = lib.mkForce true;
    fontconfig.defaultFonts = {
      emoji = [ "JoyPixels" ];
      monospace = [ "Cascadia Code" ];
      sansSerif = [ "Ubuntu" ];
      serif = [ "Ubuntu" ];
    };
    fonts = with pkgs; [
      cascadia-code
      ubuntu_font_family
      noto-fonts-cjk
      joypixels
      (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
  };

  networking.hostName = "cludadwy";
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };


  users.users.qlixior = {
    description = "Qlixior";
    isNormalUser = true;
    createHome = true;
    home = "/home/qlixior";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" "adbusers" ];
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console. keyMap = "us";
  console.font = "Lat2-Terminus16";

  system.stateVersion = "22.11"; # cunny comment
}
