{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  xdg.userDirs = {
    enable = true;
    documents = "$HOME/docs/";
    download = "$HOME/dl/";
    videos = "$HOME/vids/";
    music = "$HOME/music/";
    pictures = "$HOME/pics/";
    desktop = "$HOME/stuff/other/";
    publicShare = "$HOME/stuff/other/";
    templates = "$HOME/stuff/other/";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd -tf";
    defaultOptions = [
      "--color 'prompt:4,pointer:4,hl:4,info:4,spinner:4,border:7'"
      "--height 40%" "--layout reverse" "--border sharp"
    ];
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "OneHalfDark";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
      size = 14;
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };
    font = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
      size = 11;
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = {
      package = pkgs.yaru-theme;
      name = "Yaru-blue-dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-size = 14;
      cursor-theme = "Adwaita";
      document-font-name = "Ubuntu 11";
      font-name = "Ubuntu 11";
      color-scheme = "prefer-dark";
      gtk-color-scheme = "Yaru-blue-dark";
      gtk-theme = "Yaru-blue-dark";
      icon-theme = "Adwaita";
      monospace-font-name = "Cascadia Code 10";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "";
      titlebar-font = "Ubuntu Regular 11";
    };

    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
      sidebar-width = 160;
      sort-directories-first = true;
    };
  };

  home.stateVersion = "22.05";
}
