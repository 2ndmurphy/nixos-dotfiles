{pkgs, ...}: {
  # Sensible hardware defaults for a modern Intel laptop (tested on a ThinkPad
  # X1 Carbon Gen 13 / Lunar Lake). All generic enough to keep in the starter.

  # GPU video acceleration. hardware.graphics is enabled in desktop.nix; this
  # adds the VA-API / QSV runtimes so browsers and players decode/encode video
  # on the iGPU instead of the CPU (the single biggest battery win on Intel).
  #   intel-media-driver → the modern `iHD` VA-API driver (Gen8+ / Xe / Arc)
  #   vpl-gpu-rt         → oneVPL runtime for QuickSync (QSV) decode/encode
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vpl-gpu-rt
  ];
  # Pin the VA-API driver so libva doesn't probe/guess.
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
  # `vainfo` for inspecting the available decode/encode profiles.
  environment.systemPackages = [pkgs.libva-utils];

  # Intel thermal management daemon — keeps temps/throttling sane under load.
  # Standard on Intel laptops; complements (does not conflict with) the
  # power-profiles-daemon used by the desktop.
  #   ignoreCpuidCheck: newer Intel CPUs (e.g. Lunar Lake, family 6 model 0xbd)
  #   aren't in thermald's built-in model table yet, so it would otherwise exit
  #   with "Unsupported cpu model" at boot. Forces it to run with generic config.
  services.thermald.enable = true;
  services.thermald.ignoreCpuidCheck = true;

  # Firmware updates via LVFS: `fwupdmgr refresh && fwupdmgr update` pulls
  # BIOS/EC/Thunderbolt updates. ThinkPads are well supported upstream.
  services.fwupd.enable = true;

  # Thunderbolt / USB4 device authorization (docks, eGPUs, TB SSDs).
  # `boltctl` lists and authorizes devices.
  services.hardware.bolt.enable = true;

  # Compressed RAM swap. Faster than the disk swap partition and saves NVMe
  # wear; with 32 GB RAM the default (50% of RAM) is plenty of headroom.
  # (Note: too small to hibernate 32 GB — that still needs a disk swap ≥ RAM.)
  zramSwap.enable = true;

  # Fingerprint reader (enroll with `fprintd-enroll`). Wires fingerprint auth
  # into PAM for login/sudo via the libfprint stack.
  services.fprintd.enable = true;
}
