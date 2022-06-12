{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;

  xdg = {
    dataHome = "~/.local/share";
    userDirs = {
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
  };

  programs = {
    foot = import ./foot/foot.nix lib;
    waybar = import ./waybar/waybar.nix ;
  };

  wayland.windowManager.sway = import ./sway/sway.nix lib;

  programs.lf = {
    enable = true;
    extraConfig = "$mkdir -p ~/.trash";
    commands = {
      trash = "$IFS=\"'printf '\\n\\t''\"; mv $fx ~/.trash";
    };
    keybindings = { D = "trash"; };
    settings = {
      incsearch = true;
      hidden = true;
    };
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "OneHalfDark";
    };
  };

  programs.mako = {
    enable = true;
    backgroundColor = "#151515";
    borderColor = "#98c379";
    font = "monospace 10";
    progressColor = "#3b3f4c";
    textColor = "#abb2bf";
  };


  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "svrny";
    userEmail = "qlixior@gmail.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };


  programs.swaylock.settings = {
    color = "#000000";
    font-size = 14;
    font = "monospace";
    indicator-radius = "=40";
    indicator-thickness = "=10";
    bs-hl-color = "#3d3d3d";
    inside-color = "#151515";
    inside-clear-color = "#151515";
    inside-ver-color = "#151515";
    inside-wrong-color = "#151515";
    line-uses-inside = true;
    key-hl-color = "#3d3d3d";
    ring-color = "#151515";
    ring-clear-color = "#151515";
    ring-ver-color = "#151515";
    ring-wrong-color = "#151515";
    separator-color = "#151515";
    text-color = "#ffffff";
    text-clear-color = "#ffffff";
    text-ver-color = "#ffffff";
    text-wrong-color = "#ffffff";
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
      size = 14;
    };
    gtk2 = { configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc"; };
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
