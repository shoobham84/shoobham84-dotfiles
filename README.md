# Dotfiles — shoobham84

Personal dotfiles for zsh, neovim, tmux, git, and various CLI tools.

## What's Included

| Tool | Config | Description |
|------|--------|-------------|
| **zsh** | `zsh/zshrc`, `zsh/p10k.zsh`, `zsh/aliases.zsh` | Shell config with Oh My Zsh + Powerlevel10k |
| **neovim** | `nvim/` | Kickstart-based Neovim config |
| **tmux** | `tmux/tmux.conf` | Gruvbox-themed tmux with vim-tmux-navigator |
| **git** | `git/gitconfig`, `gitignore` | Git config with global ignores |
| **fd** | `fd/ignore` | Global ignore patterns for fd |
| **bat** | `bat/config` | Gruvbox-themed bat (cat replacement) config |

## Dependencies

Installed automatically by `install.sh`:

- **Shell**: zsh, oh-my-zsh, powerlevel10k, fzf-tab, zsh-syntax-highlighting
- **Editor**: neovim (with lazy.nvim — plugins auto-install on first launch)
- **Terminal multiplexer**: tmux + TPM
- **CLI tools**: fzf, fd, bat, zoxide, ripgrep, btop, htop, curl, wget
- **Dev**: nvm (Node.js)
- **Optional**: bun

## Quick Install

```bash
git clone git@github.com:shoobham84/shoobham84-dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Supports **Arch Linux** (`pacman`) and **Debian/Ubuntu** (`apt`) out of the box.

## What `install.sh` Does

1. Installs system packages via the detected package manager
2. Installs Oh My Zsh + Powerlevel10k + fzf-tab + zsh-syntax-highlighting
3. Installs Tmux Plugin Manager (TPM)
4. Installs NVM (Node Version Manager)
5. Symlinks all configs (backs up any existing files first)
6. Sets zsh as the default shell

## Post-Install

1. **Restart your terminal** or run `zsh`
2. **Tmux** — open tmux and press `prefix + I` to install plugins
3. **Neovim** — open `nvim` and let lazy.nvim auto-install plugins
4. **Prompt** — run `p10k configure` if you want to reconfigure the prompt
5. **Bun** (optional) — `curl -fsSL https://bun.sh/install | bash`

## Directory Structure

```
dotfiles/
├── bat/
│   └── config              # bat theme and display settings
├── fd/
│   └── ignore              # global ignore patterns for fd
├── git/
│   └── gitconfig           # git user, editor, aliases, global ignores
├── gitignore               # global gitignore (referenced by gitconfig)
├── install.sh              # one-command installer
├── nvim/                   # neovim config (kickstart-based)
│   ├── init.lua
│   └── lua/
├── tmux/
│   └── tmux.conf           # gruvbox-themed tmux config
├── zsh/
│   ├── aliases.zsh         # shell aliases (WSL ones are auto-skipped on native Linux)
│   ├── p10k.zsh            # powerlevel10k prompt config
│   └── zshrc               # main zsh config
└── README.md
```
