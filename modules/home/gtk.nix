{pkgs, ...}: {
  # Icon theme for Nautilus and every other GTK app. Stylix paints GTK *colors*
  # (adw-gtk3 + the Kanagawa base16 palette, see modules/nixos/stylix.nix) but
  # deliberately leaves the icon theme alone — without this, Nautilus falls back
  # to the bare hicolor/Adwaita defaults and looks plain.
  #
  # Papirus is the most complete Linux icon set (full folder + mime coverage).
  # Its default folder accent is already blue, which lines up with Kanagawa's
  # base0D (#7e9cd8) — so we use the plain prebuilt package straight from the
  # binary cache. (Recoloring via `.override { color = ...; }` would force a
  # slow from-source rebuild of the whole icon set for no visible gain here.)
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
