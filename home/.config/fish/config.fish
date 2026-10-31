fish_add_path -m ~/.local/bin

set -g fish_key_bindings fish_vi_key_bindings

if status is-interactive
    type -q mise; and mise activate fish | source
    type -q starship; and starship init fish | source
end
