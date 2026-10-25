{username, ...}: {
  imports = [
    ./cli.nix
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./ghostty.nix
    ./neovim.nix
    ./zed.nix
    ./gtk.nix
    ./niri.nix
    ./noctalia.nix
    ./direnv.nix
    ./claude-code.nix
    ./apps.nix
    ./media.nix
    ./discord.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Match system.stateVersion in hosts/nnn/default.nix. Don't bump casually.
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
