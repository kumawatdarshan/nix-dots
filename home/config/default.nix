{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./git
    ./mpv
    ./foot
    ./helix
  ];
  home.file.".config/starship.toml".source = ./starship.toml;

  home.packages = with pkgs; [
    inputs.helix-driver.packages.${pkgs.system}.helix
    foot
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      enter_accept = false;
      filter_mode_shell_up_key_binding = "directory";
    };
  };
}
