# Dotfiles

Personal dotfiles for Fedora.  
Configs for neovim, kitty, zsh, tmux, obsidian, and pandoc.  

## Setup

I don't really recommend anyone but me using this automation scripts.  
They fit into my setup and my naming conventions on my machines, probably not yours OOTB.

### Clone 

```sh
git clone https://github.com/yourusername/Dotfiles ~/dot
chmod +x ~/dot/install.sh ~/dot/symlink.sh
```

### Install

```sh
bash ~/dot/install.sh
```

### Symlink

```sh
bash ~/dot/symlink.sh
```

## Notes

- Obsidian is installed via Flatpak, needs Flathub activated.
- `symlink.sh` is safe to re-run.
