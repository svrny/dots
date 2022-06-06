lib: {
  enable = true;
  systemd.enable = true;
  systemd.target = "sway-session.target";
  style = ./style.css;
  settings = {
    mainBar = {
      layer = "top";
      height = 30;
      position = "top";
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = lib.mkDefault [ "pulseaudio" "sway/language" "battery" "clock" ];
      "battery" = {
        format = "{capacity}% {icon}";
        format-icons = [ "" "" "" "" "" ];
        interval = 60;
        max-length = 25;
        states = {
          critical = 15;
          warning = 30;
        };
      };
      "clock" = {
        format = "{:%m-%d %H:%M}";
        interval = 60;
      };
      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-icons = {
          car = "";
          default = [ "" "" ];
          hands-free = "";
          headphone = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = "";
        on-click = "pavucontrol";
        scroll-step = 1;
      };
      "sway/language" = {
        format = "{}";
        tooltip = false;
      };
      "sway/mode" = {
        format = " {}";
        max-length = 50;
      };
      "sway/window" = {
        format = "{}";
        max-length = 50;
        rewrite = {
          "(.*) ([·-] (.*))?— Mozilla Firefox" = " Firefox";
          "foot" = " Terminal";
        };
      };
    };
  };
}
