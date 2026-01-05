{
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak.uninstallUnmanaged = false;
  services.flatpak.enable = true;
  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];

  services.flatpak.packages = [
    {
      appId = "com.stremio.Service";
      origin = "flathub";
    }
    {
      appId = "org.freedesktop.Platform/x86_64/24.08";
      origin = "flathub";
    }
  ];
}
