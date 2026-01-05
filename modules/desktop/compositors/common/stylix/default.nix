{
  config,
  self,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    image = "${self}/assets/images/goatv3.jpg";
    base16Scheme = "${self}/assets/colorscheme.yaml";
    polarity = "dark";
    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = true;

    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.nerd-fonts.ubuntu-sans;
        name = "Ubuntu Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
