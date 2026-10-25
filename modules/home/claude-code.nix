{...}: {
  # Claude Code — Anthropic's official CLI (binary: `claude`). Marked unfree, so
  # it relies on the allowUnfree set in flake.nix.
  #
  # We only install the package; ~/.claude (auth, settings, projects) stays
  # runtime-managed, so nothing here fights what `claude` writes at runtime.
  # To manage it declaratively instead, set programs.claude-code.settings,
  # .agents, .commands, .mcpServers, … (see the home-manager module docs) — the
  # settings.json file is only written once you provide some.
  programs.claude-code.enable = true;
}
