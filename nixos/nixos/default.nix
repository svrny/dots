{ config, lib, pkgs, home-manager, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      #keep-outputs = true;
      #keep-derivations = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    joypixels.acceptLicense = true;
  };

  environment = {
    defaultPackages = lib.mkForce [ ];
    shells = with pkgs; [ zsh bashInteractive ];

    systemPackages = (with pkgs; [
      # Gui apps
      firefox-wayland gimp libreoffice-fresh
      pavucontrol imv
      # Cli utils
      # duf inotify-tools wget du-dust musikcube
      jq bat htop btop ripgrep zoxide cryptsetup
      fd fzf curl sysz unzip ffmpeg android-tools
      lf git lsd tmux delta neovim killall yt-dlp
      libqalculate alsa-utils procps
      # Dev
      elixir nodejs gcc python310
      # Nix
      nix-tree nix-index nixpkgs-fmt nixfmt
    ]) ++ (with pkgs.gnome; [
      # Gnome apps
      nautilus totem sushi evince eog
    ]);
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    /* colors = [
      "151515" "e55561" "8ebd6b" "e2b86b" "4fa6ed" "bf68d9" "48b0bd" "a0a8b7"
      "353535" "ff2748" "1ef78d" "facf31" "1a7aff" "ea5bae" "00b8ff" "dcdcdc"
    ]; */
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        groups = [ "wheel" ]; keepEnv = true; persist = true;
      }];
    };
    #lockKernelModules = true;
    protectKernelImage = true;
    unprivilegedUsernsClone = true;
    rtkit.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    dbus.enable = true;
    xserver.desktopManager.xterm.enable = false;
  };

  users.users.qlixior = {
    description = "Qlixior";
    isNormalUser = true;
    createHome = true;
    home = "/home/qlixior";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" "adbusers" ];
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  fonts = {
    fontconfig.defaultFonts = {
      emoji = [ "JoyPixels" ];
      monospace = [ "Cascadia Code" ];
      sansSerif = [ "Ubuntu" ];
      serif = [ "Ubuntu" ];
    };
    fonts = with pkgs; [
      terminus_font
      cascadia-code
      font-awesome
      ubuntu_font_family
      noto-fonts-cjk
      joypixels
      #(nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      grim swayidle wl-clipboard foot
      mako swaylock wf-recorder slurp
      brightnessctl waybar
      sway-contrib.grimshot
    ];
  };

  system.stateVersion = "22.11";
}
