# dotfiles

Oppsett for p16s: Ubuntu, sway, Noctalia og fish.

- `home/` speiler `$HOME` og symlinkes inn med [GNU stow](https://www.gnu.org/software/stow/).
  Endringer i repoet gjelder umiddelbart.
- `packages/apt.txt` er pakkene fra Ubuntu.
- `packages/recipes/` har ett lite skript per ting som trenger eget repo eller installer
  (docker, mise, fisher). Hvert skript har `source:` og `verified:` øverst.
- CLI-verktøy som ikke finnes i Ubuntu legges i `home/.config/mise/config.toml`,
  fish-plugins i `home/.config/fish/fish_plugins`.

## Ny maskin

1. Installer avhengigheter
  - Noctalia: https://docs.noctalia.dev/noctalia/getting-started/installation/

2. Installer dotfiles

```bash
sudo apt install git make
git clone https://github.com/sondrele/dotfiles.git ~/dev/me/dotfiles
cd ~/dev/me/dotfiles
make preview    # se hva som blir linket, og om noe står i veien
make install    # packages + link + recipes
```

Hvis `make preview` viser konflikter (filer som allerede finnes), flytt dem bort eller kjør
`stow --adopt --no-folding -t ~ home` og sjekk `git diff` etterpå.

Test før man setter opp en ny maskin: `make test` kjører `make install` i en ny Ubuntu-container
(`UBUNTU=26.04` som standard). Den tester ikke selve skrivebordet, bare at alt installeres og linkes.

3. Logg ut og inn igjen, så `fish` blir login shell (`make install` setter det)

4. Sett opp git-identiteter

Den delte git-configen har ingen identitet. Hver mappe under `~/dev/` med egne repoer får sin
egen `.gitconfig`, f.eks. `~/dev/<work>/.gitconfig`:

```ini
[user]
	name = <name>
	email = <email>
[commit]
	gpgSign = true    # bare der det trengs
```

Koble mappene til identitetene i `~/.gitconfig` (lokal, ikke i repoet), én blokk per mappe:

```ini
[includeIf "gitdir:~/dev/me/"]
	path = ~/dev/me/.gitconfig
[includeIf "gitdir:~/dev/<work>/"]
	path = ~/dev/<work>/.gitconfig
```

Repoer utenfor disse mappene har ingen identitet, og git nekter å committe der i stedet for å
gjette. Sjekk med `git config user.email` i et repo.

5. Valgfritt: maskiner der enhetssjekker krever `swayidle`

Legg denne i `~/.config/sway/config.d/idle` (lokal, ikke i repoet). Den låser også før dvale:

```
exec swayidle -w \
    timeout 600 'noctalia msg session lock' \
    timeout 660 'noctalia msg dpms-off' resume 'noctalia msg dpms-on' \
    before-sleep 'noctalia msg session lock'
```

## Til daglig

| Kommando        | Hva                                                             |
|-----------------|-----------------------------------------------------------------|
| `make doctor`   | Viser avvik: manglende linker, pakker, ucommittede endringer    |
| `make link`     | Linker nye filer fra `home/`                                    |

Fish kjører `doctor --quiet` én gang per døgn og sier fra med én linje hvis noe har drevet.

Ny config: legg filen på riktig sti under `home/` og kjør `make link`.

Pakker holdes for hånd i `packages/apt.txt`. Det som ikke passer der (egne repoer, apper som
installeres som `deb`) står under «Manuelt».

## Noctalia

Skjermen låses etter 10 minutter via Noctalia (`config.toml`).

Felles oppsett (bar, tema) ligger i `home/.config/noctalia/config.toml`. Endringer gjort i
Noctalias innstillinger lagres i `~/.local/state/noctalia/settings.toml` og vinner over filen.
Flytt det som skal beholdes til `config.toml`, fjern det fra `settings.toml`, og sjekk med
`noctalia config validate`.

## Skjermer

Skjermoppsettet styres av [kanshi](https://sr.ht/~emersion/kanshi/) (`home/.config/kanshi/config`),
ikke av Noctalia eller sway-configen. kanshi har én profil per oppsett (bare laptop, hjemme, jobb …)
og bytter automatisk når skjermer kobles til eller fra.

Ny profil:

1. Koble til skjermen og åpne `nwg-displays`. Dra skjermene på plass og les av posisjon og skala.
2. Finn skjermens navn med `swaymsg -t get_outputs` (bruk «make model serial»-beskrivelsen i
   anførselstegn, så matcher profilen akkurat den skjermen uansett port).
3. Legg til en `profile` i `home/.config/kanshi/config` og kjør `kanshictl reload`.

Laptopskjermen slås av når lokket lukkes og på igjen når det åpnes.

## Manuelt

- Electron-apper som `deb`-pakker: Slack, Code, Spotify.
    - Nyere Electron velger Wayland selv. Hvis ikke, legg til
      `--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto`
      i `Exec=` i en kopi av `.desktop`-filen under `~/.local/share/applications/`.
- Nerd Font for ikoner i starship: https://www.nerdfonts.com/
