{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "$HOME/docs/";
    download = "$HOME/dl/";
    videos = "$HOME/vids/";
    music = "$HOME/music/";
    pictures = "$HOME/pics/";
    desktop = "$HOME/stuff/other/";
    publicShare = "$HOME/stuff/other/";
    templates = "$HOME/stuff/other/";
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "svrny";
    userEmail = "qlixior@gmail.com";
    extraConfig.core.editor = "nvim";
  };

  gtk = let yaru = {
    package = pkgs.yaru-theme;
    name = "Yaru-blue-dark";
  }; in {
    enable = true;
    theme = yaru;
    iconTheme = yaru;
    font = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
      size = 11;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  dconf.settings = let 
    yaru = "Yaru-blue-dark";
    font = "Ubuntu 11";
  in {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Yaru";
      document-font-name = font;
      font-name = font;
      color-scheme = "prefer-dark";
      gtk-theme = yaru;
      icon-theme = yaru;
      monospace-font-name = "Cascadia Code 10";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = yaru;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "";
    };

    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
      sidebar-width = 160;
      sort-directories-first = true;
    };
  };

  home.stateVersion = "22.11";
}
