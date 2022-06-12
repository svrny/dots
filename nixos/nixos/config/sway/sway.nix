lib: {
  enable = true;
  systemdIntegration = false;
  wrapperFeatures = { gtk = true; };
  swaynag = {
    enable = true;
    settings = {
      "<config>" = {
        edge = "top";
        font = "monospace 10";
        details-border-size = 0;
        button-border-size = 2;
        button-gap = 0;
        button-dismiss-gap = 0;
        border-bottom-size = 0;
      };

      "warning" = {
        background = "000000e5";
        border = "e5c07b";
        border-bottom = "e5c07b";
        button-background = "282c34";
        text = "abb2bf";
        button-text = "e5c07b";
        details-background = "3b3f4c";
      };

      "error" = {
        background = "000000e5";
        border = "e86671";
        border-bottom = "e86671";
        button-background = "282c34";
        text = "abb2bf";
        button-text = "e86671";
        details-background = "3b3f4c";
      };
    };
  };
  config = {
    bars = [{ command = "waybar"; }];
    bindkeysToCode = true;
    colors = let
      default = {
        border = "#282c34";
        background = "#282c34";
        text = "#abb2bf";
        indicator = "#abb2bf";
        childBorder = "#282c34";
      };
    in {
      focused = {
        border = "#4fa6ed";
        background = "#4fa6ed";
        text = "#282c34";
        indicator = "#282c34";
        childBorder = "#4fa6ed";
      };
      focusedInactive = default;
      placeholder = default;
      unfocused = default;
      urgent = default;
    };
    window.border = 1;
    floating = {
      criteria = [
        { class = "Pavucontrol"; }
        { app_id = "launcher"; }
      ];
    };
    fonts = {
      names = [ "Cascadia Code" "FontAwesome5Free" ];
      size = 10.0;
    };
    gaps = {
      inner = 7;
      smartBorders = "on";
      smartGaps = true;
    };
    input = {
      "type:keyboard" = {
        xkb_layout = "us,ru";
        xkb_options = "grp:caps_toggle";
      };
      "type:touchpad" = {
        left_handed = "enabled";
        tap = "enabled";
        natural_scroll = "enabled";
        dwt = "enabled";
      };
    };
    output = { "*" = { bg = "~/.local/wallpaper/nix.png fill"; }; };
    seat = { "*" = { hide_cursor = "when-typing enable"; }; };

    startup = [
      { command = "pgrep -x mako || mako &"; }
      { command = ''pgrep -x foot --server || \
        foot --server --log-no-syslog --log-level=none &''; }
      #{ command = "pgrep -x autotiling || autotiling &"; }
    ];

    workspaceAutoBackAndForth = true;

    menu = ''footclient --app-id=launcher sh -c " \
      ls /run/current-system/sw/bin $HOME/.nix-profile/bin | \
      fzf --height=100% --border=none --margin=0,1 | \
      xargs swaymsg exec --"
    '';
    modifier = "Mod4";
    terminal = "footclient";

    modes = {
      power = {
        p = "exec systemctl poweroff; mode 'default'";
        r = "exec systemctl reboot; mode 'default'";
        s = "exec swaylock; exec systemctl suspend; mode 'default'";
        l = "exec swaylock; mode 'default'";

        Return = "mode 'default'";
        Escape = "mode 'default'";
      };
    };

    keybindings = let
      modifier = "Mod4";
    in lib.mkOptionDefault {
      "XF86MonBrightnessDown" = "exec brightnessctl s 5-";
      "XF86MonBrightnessUp" = "exec brightnessctl s +5";

      "XF86AudioRaiseVolume" = "exec amixer set Master 1+";
      "XF86AudioLowerVolume" = "exec amixer set Master 1-";
      "XF86AudioMute" = "exec amixer set Master toggle";

      "XF86AudioPlay" = "exec playerctl play-pause";
      "XF86AudioNext" = "exec playerctl next";
      "XF86AudioPrev" = "exec playerctl previous";

      "${modifier}+Shift+p" = "exec grimshot copy window";
      "${modifier}+p" = "exec grimshot copy screen";

      "${modifier}+Shift+f" = "exec firefox";

      "${modifier}+c" = "mode 'power'";
    };
  };
}
