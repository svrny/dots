{ config, lib, pkgs, home-manager, ... }: {
  imports = [ ./hardware-configuration-zfs.nix ./zfs.nix ];

  nix.package = pkgs.nixUnstable;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = (with pkgs; [
      # Gui apps
      firefox-wayland gimp libreoffice-fresh element-desktop
      vscodium-fhs tilix
      # Cli utils
      jq bat htop btop ripgrep zoxide fd fzf curl sysz unzip ffmpeg git
      lf lsd tmux delta neovim killall yt-dlp libqalculate wl-clipboard
      # Dev tools
      elixir nodejs gcc python310
    ]);
    gnome.excludePackages = (with pkgs; [
      gnome-tour gnome-text-editor
    ]) ++ (with pkgs.gnome; [
      gnome-maps gnome-contacts yelp cheese gnome-music
      gnome-terminal gedit epiphany geary
      gnome-characters tali iagno hitori atomix
    ]);
  };

  virtualisation.podman.enable = true;

  fonts = {
    fontconfig.defaultFonts = {
      emoji = [ "Noto" ];
      monospace = [ "Cascadia Code" ];
      sansSerif = [ "Ubuntu" ];
      serif = [ "Ubuntu" ];
    };
    fonts = with pkgs; [
      cascadia-code
      ubuntu_font_family
      noto-fonts-cjk
      noto-fonts-emoji
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
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };

  time.timeZone = "Europe/Moscow";
  system.stateVersion = "22.11"; # cunny comment
}
