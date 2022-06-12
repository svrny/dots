{
  enable = true;
  systemd.enable = false;
  #systemd.target = "sway-session.target";
  style = ./style.css;
  settings = let
    layer = "top";
    height = 32;
  in {
    topbar = {
      inherit layer;
      inherit height;
      name = "topbar";
      position = "top";
      modules-left = [
        "battery"
        "custom/separator"
        #"disk"
        #"custom/separator"
        "memory"
        "custom/separator"
        "cpu"
        "custom/separator"
        "pulseaudio"
        "custom/separator"
        "idle_inhibitor"
      ];
      modules-center = [ "sway/window" ];
      modules-right = [
        "sway/language"
        "custom/separator"
        "custom/uptime"
        "custom/separator"
        "clock"
      ];
      "custom/separator" = {
        format = "|";
        tooltip = false;
      };
      "idle_inhibitor" = {
        format = "{icon} idle";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };
      "clock" = {
        interval = 1;
        format = " <b>{:%H:%M:%S}</b>";
        format-alt = " {:%y-%m-%d}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      "cpu" = {
        format = " {usage}%";
        tooltip = false;
      };
      /* "disk" = {
        format = " {used}";
        tooltip-format = "{used} / {total} used";
        path = "/nix/store";
        interval = 60;
      }; */
      "memory" = {
        format = " {}%";
        tooltip-format = "{used:0.1f}G / {total:0.1f}G used";
      };
      "custom/uptime" = {
        exec = "uptime -p | sed 's/up //; s/ days\\?,\\?/d/; s/ minutes\\?,\\?/m/; s/ hours\\?,\\?/h/; s/ seconds\\?/s/'";
        #  
        format = " <span style=\"italic\">{}</span>";
        interval = 60;
      };
      "battery" = {
          interval = 60;
          states = {
              warning = 30;
              critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
      };
      "pulseaudio" = {
        scroll-step = 1;
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%{format_source}";
        format-bluetooth-muted = " {icon}{format_source}";
        format-muted = " {format_source}";
        format-icons = {
          headphone = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "pavucontrol";
      };
      "sway/language" = {
        format = " {}";
        tooltip = false;
      };
      "sway/window" = {
        format = "{}";
        max-length = 50;
        rewrite = {
          "(.*) — Mozilla Firefox" = "Firefox";
          "foot" = "Terminal";
        };
      };
    };
    bottombar = {
      inherit layer;
      inherit height;
      name = "bottombar";
      position = "bottom";
      modules-left = ["tray"];
      modules-center = ["wlr/taskbar"];
      modules-right = ["sway/workspaces" "sway/mode"];
      "tray" = {
          icon-size = 13;
          spacing = 10;
      };
      "wlr/taskbar" = {
          format = "{name}";
          #icon-size = 13;
          tooltip = false;
          on-click = "activate";
          on-click-right = "close";
      };
      "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
      };
    };
  };
}
