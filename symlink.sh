#!/bin/bash
set -e

# Helpers

info() { echo -e "\e[34m[INFO]\e[0m  $*"; }
ok()   { echo -e "\e[32m[ OK ]\e[0m  $*"; }
die()  { echo -e "\e[31m[FAIL]\e[0m  $*" >&2; exit 1; }

DOT="$HOME/dot"

# Sanity check

[[ -d "$DOT" ]] || die "~/dot not found. Rename your cloned repo to 'dot' first."

# Required directories

info "Creating required directories..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/niri"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/obs/Hive/99 - Meta"
mkdir -p "$HOME/obs/Hive/.obsidian"
ok "Directories ready"

# Symlinks

warn() { echo -e "\e[33m[WARN]\e[0m  $*"; }

link() {
    local src="$1" dest="$2"
    [[ -e "$src" ]] || warn "source missing: $src"
    if [[ -e "$dest" && ! -L "$dest" ]]; then
        warn "$dest exists and is not a symlink : skipping"
        return
    fi
    ln -sfn "$src" "$dest"
    ok "$dest  →  $src"
}

info "Creating symlinks..."
link "$DOT/nvim"                    "$HOME/.config/nvim"
link "$DOT/kitty"                   "$HOME/.config/kitty"
link "$DOT/.zshrc"                  "$HOME/.zshrc"
link "$DOT/.p10k.zsh"               "$HOME/.p10k.zsh"
link "$DOT/niri/config.kdl"         "$HOME/.config/niri/config.kdl"
link "$DOT/niri/workspaces.kdl"     "$HOME/.config/niri/workspaces.kdl"
link "$DOT/bin/toggle-theme"        "$HOME/.local/bin/toggle-theme"
link "$DOT/tmux/.tmux.conf"         "$HOME/.tmux.conf"
link "$DOT/obsidian/obsidian.vimrc" "$HOME/obs/Hive/99 - Meta/obsidian.vimrc"
link "$DOT/obsidian/snippets"       "$HOME/obs/Hive/.obsidian/snippets"
link "$DOT/.pandoc"                 "$HOME/.pandoc"

info "Checking for dangling symlinks..."
dangling=$(find "$HOME/.config" "$HOME/obs" -maxdepth 2 -xtype l 2>/dev/null)
if [[ -n "$dangling" ]]; then
    echo "$dangling" | while read -r l; do warn "dangling: $l"; done
else
    ok "No dangling symlinks"
fi

info "GNOME shortcuts are not symlinked (dconf is a binary DB)."
info "To import them:  dconf load /org/gnome/settings-daemon/plugins/media-keys/ < $DOT/gnome/media-keys.dconf"
info "note: bzbzz is hardcoded somewhere in that file, replace it"

# Done
echo ""
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
echo -e "\e[32m  Symlinks complete.\e[0m"
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
