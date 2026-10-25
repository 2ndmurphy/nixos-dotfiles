{...}: {
  # Image viewer + media player. Both are Wayland-native and keyboard-driven,
  # matching the niri/CLI-forward feel of the rest of the config. Stylix themes
  # them automatically where it ships a target (autoEnable is on).

  # imv: minimal Wayland image viewer. `q` quits, arrows/`n`/`p` cycle a folder.
  programs.imv.enable = true;

  # mpv: does-everything media player. Sane defaults; tweak in the settings set.
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe"; # GPU decode when the driver supports it, else CPU.
      keep-open = "yes"; # Don't close the window when a file ends.
      save-position-on-quit = "yes"; # Resume long videos where you left off.
    };
  };

  # Make them the default handlers. zed.nix already sets `xdg.mimeApps.enable`
  # and claims the text/* types; these attrsets merge across modules, so we only
  # add the image/audio/video associations here (don't re-set `enable`, which
  # would be a conflicting definition).
  xdg.mimeApps.defaultApplications = let
    imv = "imv.desktop";
    mpv = "mpv.desktop";
  in {
    "image/jpeg" = imv;
    "image/png" = imv;
    "image/gif" = imv;
    "image/webp" = imv;
    "image/bmp" = imv;
    "image/tiff" = imv;
    "image/avif" = imv;
    "image/svg+xml" = imv;

    "audio/mpeg" = mpv;
    "audio/flac" = mpv;
    "audio/x-wav" = mpv;
    "audio/ogg" = mpv;
    "audio/opus" = mpv;
    "audio/aac" = mpv;
    "audio/mp4" = mpv;

    "video/mp4" = mpv;
    "video/x-matroska" = mpv;
    "video/webm" = mpv;
    "video/quicktime" = mpv;
    "video/x-msvideo" = mpv;
    "video/mpeg" = mpv;
  };
}
