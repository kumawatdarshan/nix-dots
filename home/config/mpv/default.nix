{
  config,
  pkgs,
  ...
}: {
  programs.mpv.scripts = with pkgs.mpvScripts; [
    mpris
    modernz
    thumbfast
    autosubsync-mpv
    sponsorblock
  ];

  xdg.configFile."mpv/scripts/skip-intro.lua".source = config.lib.file.mkOutOfStoreSymlink ./skip-intro.lua;
  xdg.configFile."mpv/scripts/ytsub.lua".source = config.lib.file.mkOutOfStoreSymlink ./ytsub.lua;

  programs.mpv = {
    enable = true;
    config = {
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

      audio-samplerate = 88200; # fix for audio/video desync
      hwdec = "auto";
      vo = "gpu";
      gpu-context = "wayland";
    };

    scriptOpts = {
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
  };

  home.packages = with pkgs; [
    mpv-handler
  ];
}
