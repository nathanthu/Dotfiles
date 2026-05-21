#!/bin/bash
set -e

# Helpers

info() { echo -e "\e[34m[INFO]\e[0m  $*"; }
ok()   { echo -e "\e[32m[ OK ]\e[0m  $*"; }
warn() { echo -e "\e[33m[WARN]\e[0m  $*"; }
die()  { echo -e "\e[31m[FAIL]\e[0m  $*" >&2; exit 1; }

# Sanity check

[[ -d "$HOME/dot" ]] || die "~/dot not found. Rename your cloned repo to 'dot' first."

# Base dirs

info "Creating ~/.config if needed..."
mkdir -p "$HOME/.config"
ok "~/.config ready"

# DNF packages

info "Installing DNF packages..."
sudo dnf install -y neovim kitty zsh zoxide bat fzf eza
ok "DNF packages installed"

# COPR: lazygit

info "Enabling COPR for lazygit..."
sudo dnf copr enable -y dejan/lazygit
info "Installing lazygit..."
sudo dnf install -y lazygit
ok "lazygit installed"

# COPR: yazi

info "Enabling COPR for yazi..."
sudo dnf copr enable -y lihaohong/yazi
info "Installing yazi..."
sudo dnf install -y yazi
ok "yazi installed"

# Flatpak: Obsidian

info "Installing Obsidian via Flatpak..."
flatpak install -y flathub md.obsidian.Obsidian
ok "Obsidian installed"

# Oh My Zsh

if [[ -d "$HOME/.oh-my-zsh" ]]; then
    warn "Oh My Zsh already installed, skipping"
else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    ok "Oh My Zsh installed"
fi

# Powerlevel10k

P10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
if [[ -d "$P10K_DIR" ]]; then
    warn "Powerlevel10k already installed, skipping"
else
    info "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
    ok "Powerlevel10k installed"
fi

# ZSH plugins

ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"

clone_plugin() {
    local name="$1"
    local url="$2"
    if [[ -d "$ZSH_PLUGINS_DIR/$name" ]]; then
        warn "$name already installed, skipping"
    else
        info "Installing $name..."
        git clone --depth=1 "$url" "$ZSH_PLUGINS_DIR/$name"
        ok "$name installed"
    fi
}

clone_plugin "zsh-autosuggestions"     "https://github.com/zsh-users/zsh-autosuggestions"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
clone_plugin "zsh-completions"         "https://github.com/zsh-users/zsh-completions"
clone_plugin "fzf-tab"                 "https://github.com/Aloxaf/fzf-tab"

# Default shell

info "Changing default shell to zsh..."
chsh -s "$(which zsh)"
ok "Default shell set to zsh"

# Pandoc (main pc only, uncomment to install, but never verified yet)
# info "Installing pandoc..."
# sudo dnf install -y pandoc
# ok "pandoc installed"

# Done
echo ""
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
echo -e "\e[32m  Installation complete.\e[0m"
echo -e "\e[32m══════════════════════════════════════════════\e[0m"
echo ""
echo "  Next steps:"
echo "    1. Run ./symlink.sh to create all config symlinks"
echo "    2. Log out and back in for zsh to become your default shell"
echo ""
warn "Logout required for shell change to take effect."
