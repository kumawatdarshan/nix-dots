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

    bindings = {
      "CTRL+1" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A (HQ)"'';
      "CTRL+2" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B (HQ)"'';
      "CTRL+3" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C (HQ)"'';
      "CTRL+4" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A+A (HQ)"'';
      "CTRL+5" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B+B (HQ)"'';
      "CTRL+6" = ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C+A (HQ)"'';
      "CTRL+0" = ''no-osd change-list glsl-shaders clr ""; show-text "GLSL shaders cleared"'';
    };
    config = {
      glsl-shaders = [
        "~~/shaders/Anime4K_Clamp_Highlights.glsl"
        "~~/shaders/Anime4K_Restore_CNN_VL.glsl"
        "~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl"
        "~~/shaders/Anime4K_AutoDownscalePre_x2.glsl"
        "~~/shaders/Anime4K_AutoDownscalePre_x4.glsl"
        "~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"
      ];

      osc = false;
      osd-bar = false;
      interpolation = true;
      sub-auto = "fuzzy";
      save-position-on-quit = true;
      ignore-path-in-watch-later-config = true;
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      fullscreen = true;
      cache = true;
      cursor-autohide = 3500;

      sub-border-size = 1;
      sub-color = "#FFFFFF";
      sub-shadow-color = "#000000";
      sub-shadow-offset = 2;

      audio-samplerate = 88200; # A/V drift workaround
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
