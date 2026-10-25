{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];

  # GUI desktop apps. Browsers and file managers live here rather than in the
  # CLI bundle.
  home.packages = [
    # Nautilus (GNOME Files): a sensible GTK file manager. Pairs with the gvfs
    # service enabled in modules/nixos/desktop.nix for trash + mounting, and
    # backs the browser's "open/save" file picker via the gtk xdg portal.
    pkgs.nautilus
  ];

  # Zen browser — Firefox-based, from the community flake (beta channel).
  # Managed through the flake's home-manager module (rather than just dropping
  # the package in home.packages) so that:
  #   1. `setAsDefaultBrowser` registers the xdg mime associations for
  #      http(s)/html and exports $BROWSER=zen-beta (used by gh, git, etc.).
  #   2. Stylix's zen-browser target can theme its profile (see below).
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  # Paint Zen's chrome + about:/newtab pages with the same Kanagawa base16
  # palette Stylix uses everywhere else. The target writes userChrome.css and
  # userContent.css into the named profile and flips on the
  # `toolkit.legacyUserProfileCustomizations.stylesheets` pref for us.
  stylix.targets.zen-browser.profileNames = ["default"];
}
