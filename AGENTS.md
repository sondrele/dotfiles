# AGENTS.md

Dotfiles for a single machine, the p16s: Ubuntu, sway + Noctalia shell, fish, starship and mise.
Everything is plain bash scripts plus GNU stow. There is no build step.
The README is written in Norwegian. Keep that language when you edit it.

## Layout

| Path | What |
|------|------|
| `home/` | Mirrors `$HOME`. `stow --no-folding -t ~ home` symlinks every file into place. |
| `home/.config/sway/config` | The whole desktop: keybindings, input, window rules, startup. A single file on purpose. |
| `home/.config/fish/` | `config.fish`, `conf.d/aliases.fish`, `conf.d/dotfiles.fish` (daily drift check), `fish_plugins` (fisher). |
| `home/.config/mise/config.toml` | CLI tools that aren't in Ubuntu's archive (e.g. starship). |
| `home/.local/bin/` | Small scripts: `bat`/`fd` wrappers for Ubuntu's renamed binaries, `wlprop`. |
| `packages/apt.txt` | Ubuntu packages, one per line, `#` comments allowed. |
| `packages/recipes/*.sh` | One idempotent script per thing that needs a third-party repo or installer. |
| `scripts/` | `apt`, `recipes`, `doctor`, `test`, all called from the `Makefile`. |

## Commands

- `make install`: `packages`, then `link`, then `recipes`. The order matters: apt brings in stow, and the recipes read config that `link` puts in place (`fish_plugins`, mise config).
- `make preview`: stow dry run against the real `$HOME`. It shows the links it would create and any conflicts. This is safe to run.
- `make doctor`: drift report (unlinked files, conflicts, apt.txt packages that aren't installed, uncommitted changes). `scripts/doctor` exits 1 on drift, and `--quiet` prints one line.
- `make test`: runs `make install` and `doctor` in a throwaway `ubuntu:$UBUNTU` container (default 26.04). This is the way to verify package and recipe changes. It needs Docker and network access, and takes about a minute. It cannot test sway or Noctalia themselves.

Don't run `make install`, `make link`, `make packages` or `make recipes` against the real machine unless asked. They modify `$HOME` and the system (`sudo apt`). Use `make preview` and `make test` instead.

## Extending

- **New config file:** put it under `home/` at its path relative to `$HOME`. No installer is needed.
- **New Ubuntu package:** add a line to `packages/apt.txt`.
- **New CLI tool not in Ubuntu:** add it to `home/.config/mise/config.toml`.
- **New fish plugin:** add it to `home/.config/fish/fish_plugins`.
- **Anything else:** add `packages/recipes/<name>.sh`. Follow the existing recipes:
  - `#!/bin/bash` and `set -euo pipefail`
  - a header with `source:` (official docs URL) and `verified: YYYY-MM`
  - exit early when the tool is already installed
  - copy the vendor's documented steps exactly

  Recipes run in alphabetical order.

Prefer these install methods in this order: Ubuntu apt, then mise, then the vendor's apt repo (as a recipe), then a custom script.

## Gotchas

- Stow refuses absolute symlinks inside `home/`. That's why `bat` and `fd` are wrapper scripts and not symlinks.
- Always pass `--no-folding` (the Makefile does). Without it stow links whole directories, and fisher or mise would write their files into the repo.
- fisher and `mise use -g` write back into `fish_plugins` and the mise config through the symlinks. That's intended: commit the change.
- Noctalia config lives in `home/.config/noctalia/` (every `*.toml` there is merged). Changes from Noctalia's settings dialog go to `~/.local/state/noctalia/settings.toml`, which overrides the files; shared settings belong in `config.toml`. Check with `noctalia config validate`.
- Machine-specific sway settings go in the untracked `~/.config/sway/config.d/`, included at the end of the sway config. The idle lock default lives in the Noctalia config; machines that need `swayidle` start it from a local file (see README). Keep employer names out of the repo.
- Monitors are configured by kanshi (`home/.config/kanshi/config`), started from the sway config. Don't add `output` lines to the sway config, they fight kanshi. Noctalia deliberately doesn't do monitor arrangement.
- Sway keybindings are based on the old i3 config. Lines marked `# REGOLITH:` are commented-out Regolith defaults kept as alternatives. Noctalia is driven through `noctalia msg <command>`; run `noctalia msg --help` or see https://docs.noctalia.dev/noctalia/ipc/.
- `home/.config/git/config` is the shared git base: no identity (`user.name`/`user.email`) and no signing. Identities live in untracked `~/dev/<name>/.gitconfig` files, mapped with `includeIf "gitdir:~/dev/<name>/"` in the untracked `~/.gitconfig` (which git reads after the XDG file). `user.useConfigOnly` makes git refuse to commit outside those folders. Keep employer and client names out of the repo. Don't add secrets.
- `home/.local/bin/wlprop` is vendored (MIT). Keep its license header.
- Other branches (`master`, `zbook`, `theme`, …) are old setups kept only as backups. Don't merge from them.
