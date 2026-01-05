_: {
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        inhibit_screensaver = 0;
        renice = 0; # Higher process priority
        ioprio = 0; # Highest I/O priority
      };
    };
  };
}
