{...}: {
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERMINAL = "footclient";
    VIDEO_PLAYER = "mpv";
    AUDIO_PLAYER = "mpv";
    # QT_QPA_PLATFORM = "wayland;xcb";
    # QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # GDK_BACKEND = "wayland,x11,*";
    # SDL_VIDEODRIVER = "wayland,x11";
    # CLUTTER_BACKEND = "wayland";
    __GL_VRR_ALLOWED = 1;
    __GL_GSYNC_ALLOWED = 1;
  };
}
