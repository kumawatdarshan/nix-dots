{
  lib,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    lazygit
    gh
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = config.ghUserName;
        email = config.email;
      };

      alias = {
        st = "status -sb";
        last = "log -1 HEAD --stat";
        ll = "log --graph --oneline --decorate --pretty=format:'%C(auto)%h%d %<(72,trunc)%s %n%C(green)(%ar) %C(yellow)%an%C(reset)'";
      };

      credential = {
        "https://github.com".helper = "!gh auth git-credential";
        "https://gist.github.com".helper = "!gh auth git-credential";
      };

      core.editor = "hx";
      color.ui = "true";
      blame.date = "relative";
      init.defaultBranch = "master";
      pull.rebase = true;
      fetch.prune = true;
      log.abbrevCommit = true;
      push.autoSetupRemote = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true; # required explicitly now
  };
}
