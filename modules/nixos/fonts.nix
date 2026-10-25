{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      maple-mono.NF # Maple Mono, patched with Nerd Font glyphs (mono default).
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    enableDefaultPackages = true;

    fontconfig.defaultFonts = {
      monospace = ["Maple Mono NF"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
