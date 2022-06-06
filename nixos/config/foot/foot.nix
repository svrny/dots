lib: {
  enable = true;
  server.enable = true;
  settings = {
    main = {
      font = lib.mkDefault "Cascadia Code:size=7";
      dpi-aware = "yes";
      pad = "2x2 center";
    };

    colors = {
      background = "151515";
      foreground = "a0a8b7";

      regular0 = "202020";
      regular1 = "e55561";
      regular2 = "8ebd6b";
      regular3 = "e2b86b";
      regular4 = "4fa6ed";
      regular5 = "bf68d9";
      regular6 = "48b0bd";
      regular7 = "a0a8b7";

      bright0 = "353535";
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
