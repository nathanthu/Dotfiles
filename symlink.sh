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
mkdir -p "$HOME/obs/Hive/99 - Meta"
mkdir -p "$HOME/obs/Hive/.obsidian"
ok "Directories ready"

# Symlinks

link() {
    local src="$1"
    local dest="$2"
    ln -sfn "$src" "$dest"
    ok "$dest  →  $src"
}

info "Creating symlinks..."
link "$DOT/nvim"                    "$HOME/.config/nvim"
link "$DOT/kitty"                   "$HOME/.config/kitty"
link "$DOT/.zshrc"                  "$HOME/.zshrc"
link "$DOT/.p10k.zsh"               "$HOME/.p10k.zsh"
link "$DOT/tmux/.tmux.conf"         "$HOME/.tmux.conf"
link "$DOT/obsidian/obsidian.vimrc" "$HOME/obs/Hive/99 - Meta/obsidian.vimrc"
link "$DOT/obsidian/snippets"       "$HOME/obs/Hive/.obsidian/snippets"
link "$DOT/.pandoc"                 "$HOME/.pandoc"

# Done
echo ""
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
echo -e "\e[32m  Symlinks complete.\e[0m"
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
