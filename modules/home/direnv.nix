{...}: {
  # Per-project dev environments: drop a flake + `.envrc` (`use flake`) in any
  # repo and the toolchain loads on `cd`. nix-direnv adds fast caching.
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
