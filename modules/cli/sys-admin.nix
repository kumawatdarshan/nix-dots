{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Network utilities
    dig # DNS lookup

    # Hardware information
    pciutils # PCI utilities (lspci)
    usbutils # USB utilities (lsusb)

    # File and metadata tools
    exiftool # metadata extraction/editing

    # System testing and monitoring
    stress-ng # system stress testing

    # System boot utilities
    systemdUkify # systemd boot utilities
  ];
}
