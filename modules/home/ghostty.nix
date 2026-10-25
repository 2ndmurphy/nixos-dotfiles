{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # Font + colors are supplied by Stylix; these are the ergonomic extras.
    settings = {
      window-padding-x = 12;
      window-padding-y = 12;
      window-decoration = false;
      cursor-style = "block";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;
      copy-on-select = "clipboard";
      confirm-close-surface = false;
      window-inherit-working-directory = true;
      # Background opacity is managed by Stylix (stylix.opacity.terminal).
    };
  };
}
