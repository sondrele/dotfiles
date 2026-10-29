# dotfiles

## Setup p16s

- Installere regolith: https://regolith-desktop.com/
    - Base i3-config 
        - `/etc/regolith/i3/config`
        - `/usr/share/regolith/i3/config.d/`
    - Base sway-config: 
        - /etc/regolith/sway/config
        - /etc/regolith/i3status-rust/config.toml
    - Custom config
        - Common
            - `$HOME/.config/regolith3/common-wm/config.d`
        - Sway
            - `/home/sondre/.config/i3status-rust/config.toml` (kopiert fra /etc/regolith/i3status-rust/config.toml)
            - `~/.config/regolith3/Xresources`
            - `$HOME/.config/regolith3/common-wm/config.d`
    - Bytte ut `rofication` med `dunst`
        - https://regolith-desktop.com/docs/howtos/replace-notification-system/

- Installere utils via apt:
    - `find-fd`
    - `fzf`
    - `bat` og sett opp symlink:
        - mkdir -p .local/bin
        - ln -s /usr/bin/batcat .local/bin/bat
    - `ripgrep`
    - `git-delta`

- Installere fish: https://fishshell.com/
    - Sørg for at ~/.local/bin blir tilgjengelig: `fish_add_path -m ~/.local/bin`
    - Installere `fisher`: https://github.com/jorgebucaran/fisher
    - Og andre plugins
        - `fisher install jorgebucaran/autopair.fish` - https://github.com/jorgebucaran/autopair.fish
        - `fisher install PatrickF1/fzf.fish` - https://github.com/PatrickF1/fzf.fish
        - `fisher install jethrokuan/z` - https://github.com/jethrokuan/z

- Installere `mise`: https://mise.jdx.dev/getting-started.html
    - Legg til `mise activate fish | source` i `~/.config/fish/config.fish`

- Installere `starship`: https://starship.rs/ 
    - Legg til `starship init fish | source` i `~/.config/fish/config.fish`
    - Oppdaterte config i `~/.config/starship.toml`
    - TODO:
        - Flytte plass på kubernetes til etter git
        - Skru av gcloud?

- Installere docker
    - https://docs.docker.com/engine/install/ubuntu/
    - sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

- Installere electron-applikasjoner som `deb`-pakker og gjør klargjør desktop entries for wayland:
    - `Slack`, og oppdatere desktop entry:
        - `cp /usr/share/applications/slack.desktop .local/share/applications/`
        - Endre exec: `Exec=/usr/bin/slack --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto %U`
    - `Code`, og oppdatere desktop entry:
        - `cp /usr/share/applications/code.desktop .local/share/applications/`
        - Endre exec: `Exec=/usr/share/code/code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto %F`
    - `Spotify`, og oppdatere desktop entry:
        - `cp /usr/share/applications/spotify.desktop .local/share/applications/`
        - Endre exec: `Exec=spotify --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto %U`

-