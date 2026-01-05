{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./sys-admin.nix
    ./media.nix
    ./nh.nix
  ];
  programs.git.enable = true;

  programs.yazi = {
    enable = true;
    plugins = with pkgs; {
      git = yaziPlugins.git;
      diff = yaziPlugins.diff;
      lsar = yaziPlugins.lsar;
      piper = yaziPlugins.piper;
      chmod = yaziPlugins.chmod;
      mount = yaziPlugins.mount;
      full-border = yaziPlugins.full-border;
      starship = yaziPlugins.starship;
      media-info = yaziPlugins.mediainfo;
    };
  };

  environment.systemPackages = with pkgs; [
    # Terminal file management and navigation
    mediainfo
    eza # ls replacement
    dua # disk usage analyzer

    # System monitoring and information
    bottom # top/htop replacement
    btop
    nitch # fetcher

    # Text processing and viewing
    glow # markdown viewer
    tlrc # tldr implementation
    tokei # code statistics

    # Development tools that are primarily CLI-focused
    smartcat # ai cli
  ];
}
