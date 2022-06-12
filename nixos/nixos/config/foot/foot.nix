lib: {
  enable = true;
  server.enable = true;
  settings = {
    main = {
      font = lib.mkDefault "Cascadia Code:size=7";
      dpi-aware = "yes";
      pad = "5x5 center";
    };

    colors = {
      background = "151515";
      foreground = "abb2bf";

      regular0 = "282c34"; # Black
      regular1 = "e06c75"; # Red
      regular2 = "98c379"; # Green
      regular3 = "e5c07b"; # Yellow
      regular4 = "61afef"; # Blue
      regular5 = "c678bd"; # Magenta
      regular6 = "56b6c2"; # Cyan
      regular7 = "abb2bf"; # White

      bright0 = "1f2329";
      bright1 = "ff2748";
      bright2 = "1ef78d";
      bright3 = "facf31";
      bright4 = "1a7aff";
      bright5 = "ea5bae";
      bright6 = "00b8ff";
      bright7 = "dcdcdc";
    };
  };
}
