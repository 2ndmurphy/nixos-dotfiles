{...}: {
  # systemd-boot on UEFI. If you boot legacy BIOS, swap this for GRUB.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Quiet, graphical boot to match the omarchy-style polish.
  boot.plymouth.enable = true;
  boot.kernelParams = ["quiet"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
}
