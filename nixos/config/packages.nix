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
    # Cli utils
    jq bat htop ripgrep duf du-dust neovim
    fd fzf delta musikcube sysz tmux android-tools
    gcc git wget neovim curl unzip exa
    brightnessctl killall lf ffmpeg yt-dlp
    libqalculate
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
