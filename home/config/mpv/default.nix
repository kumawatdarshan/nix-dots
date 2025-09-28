{pkgs, ...}: {
  programs.mpv.scripts = with pkgs.mpvScripts; [
    mpris
    modernz
    thumbfast
    autosubsync-mpv
    sponsorblock
  ];

  home.file.".config/mpv/scripts/skip-intro.lua".source = ./skip-intro.lua;

  programs.mpv.enable = true;
  programs.mpv.config = {
    osc = false;
    osd-bar = false;
    interpolation = true;
    video-sync = "display-resample";
    sub-auto = "fuzzy";
    save-position-on-quit = true;
    ignore-path-in-watch-later-config = true;
    ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
    fullscreen = "yes";
    cache = "yes";
    cursor-autohide = 3500;
    sub-border-size = 1;
    sub-color = "#FFFFFF";
    sub-shadow-color = "#000000";
    sub-shadow-offset = 2;

    hwdec = "auto";
    vo = "gpu";
    gpu-context = "wayland";
  };

  programs.mpv.scriptOpts = {
    uosc = {
      timeline_size = 25;
      timeline_persistency = "paused,audio";
      top_bar = "never";
      refine = "text_width";
    };
    thumbfast = {
      spawn_first = true;
      network = true;
      hwdec = false;
    };
  };
}
