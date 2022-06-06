lib: {
  enable = true;
  #systemdIntegration = true;
  wrapperFeatures = {
    gtk = true;
  };
  swaynag = {
    enable = true;
    settings = { };
  };
  config = {
    bars = [
      { command = "\${pkgs.waybar}/bin/waybar"; }
    ];
    bindkeysToCode = true;
    colors = let
      default = {
        border = "#151515";
        background = "#151515";
        text = "#abb2bf";
        indicator = "#abb2bf";
        childBorder = "#151515";
      };
    in {
      focused = default;
      focusedInactive = default;
      placeholder = default;
      unfocused = default;
      urgent = default;
    };
    floating = {
      criteria = [
        { class = "Pavucontrol"; }
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
    output = { "*" = { bg = "~/.local/wallpaper/0.jpg fill"; }; };
    seat = { "*" = { hide_cursor = "when-typing enable"; } ; };

    startup = [
      { command = "pgrep -x mako || mako &"; }
      { command = "foot --server --log-no-syslog --log-level=none &"; }
    ];

    workspaceAutoBackAndForth = true;

    menu = "bemenu-run --no-exec | xargs swaymsg exec --";
    modifier = "Mod4";
    terminal = "footclient";
    keybindings = let
      #modifier = conifg.wayland.windowManager.sway.config.modifier;
      modifier = "Mod4";
      term = "footclient";
      menu = "bemenu";
      launcher = "bemenu-run --no-exec | xargs swaymsg exec --";
    in lib.mkOptionDefault {

      "XF86MonBrightnessDown" = "exec brightnessctl s 5-";
      "XF86MonBrightnessUp" = "exec brightnessctl s +5";
      # Sound
      "XF86AudioRaiseVolume" = "exec amixer set Master 1+";
      "XF86AudioLowerVolume" = "exec amixer set Master 1-";
      "XF86AudioMute" = "exec amixer set Master toggle";
      # Media Playback
      "XF86AudioPlay" = "exec playerctl play-pause";
      "XF86AudioNext" = "exec playerctl next";
      "XF86AudioPrev" = "exec playerctl previous";

      "${modifier}+i" = ''exec \
        'case $(echo -e "suspend\nlogout\npoweroff\nreboot\nlock" | ${menu}) in \
          suspend) systemctl suspend; swaylock;; \
          logout) swaymsg exit;; \
          poweroff) systemctl poweroff;; \
          reboot) systemctl reboot;; \
          lock) swaylock;; \
        esac'
        '';

      # Start a terminal
      #"${modifier}+Return" = "exec ${term}";

      # Make a screenshot and copy to clipboard
      "${modifier}+Shift+p" = "exec grim - | wl-copy --type image/png";

      "${modifier}+p" = 
        ''exec swaymsg -t get_tree | jq -r \
          '.. | select(.pid? and .visible?) | .rect | \
          "\(.x),\(.y) \(.width)x\(.height)"' | \
          slurp -b "#101010" -c "#353535" -B "#101010e0" | \
          grim -g- - | wl-copy -t image/png
        '';

      # Start your browser
      "${modifier}+Shift+f" = "exec firefox";

      # Kill focused window
      #"${modifier}+Shift+q" = "kill";

      # Start your launcher
      #"${modifier}+d" = "exec ${launcher}";

      # Reload the configuration file
      #"${modifier}+Shift+c" = "reload";
    };
  };
}
