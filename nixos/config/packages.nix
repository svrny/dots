{ pkgs, config, ...}:

{
  nixpkgs.config = {
    allowUnfree = true;
    joypixels.acceptLicense = true;
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
      #font-awesome
      ubuntu_font_family
      noto-fonts-cjk
      joypixels
      (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
  };

  environment.systemPackages = ( with pkgs; [
    # Gui apps
    firefox-wayland gimp cinnamon.nemo
    libreoffice-fresh pavucontrol
    # Cli utils
    jq bat duf htop btop ripgrep brightnessctl
    fd fzf curl sysz unzip ffmpeg du-dust musikcube
    lf git lsd wget tmux delta neovim android-tools
    killall yt-dlp libqalculate inotify-tools zoxide
    cryptsetup
    # Dev
    elixir nodejs gcc python310 postgresql
  ]) ++ ( with pkgs.gnome; [
    # Gnome apps
    nautilus totem gvfs sushi evince eog
  ]);


  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swayidle wl-clipboard mako foot bemenu
      swaylock wf-recorder slurp grim waybar
    ];
  };
}
