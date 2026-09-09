#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── Colors ───────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Dotfiles Installer — Lord Shubham  ║"
echo "╚══════════════════════════════════════╝"
echo ""

# ── Package Installation ────────────────────────
install_packages() {
    if command -v pacman &>/dev/null; then
        info "Arch Linux detected. Installing packages..."
        sudo pacman -S --needed --noconfirm \
            zsh git tmux neovim fzf fd bat zoxide ripgrep \
            btop curl wget htop base-devel unzip
    elif command -v apt &>/dev/null; then
        info "Debian/Ubuntu detected. Installing packages..."
        sudo apt update
        sudo apt install -y \
            zsh git tmux neovim fzf fd-find bat zoxide ripgrep \
            btop curl wget htop build-essential unzip
    elif command -v emerge &>/dev/null; then
        info "Gentoo detected. Installing packages..."
        sudo emerge --ask=n --noreplace \
            app-shells/zsh dev-vcs/git app-misc/tmux app-editors/neovim \
            app-shells/fzf sys-apps/fd sys-apps/bat app-shells/zoxide \
            sys-apps/ripgrep sys-process/btop net-misc/curl net-misc/wget \
            sys-process/htop app-arch/unzip
    else
        warn "Unknown package manager. Skipping package installation."
        warn "Please manually install: zsh git tmux neovim fzf fd bat zoxide ripgrep btop"
    fi
}

# ── Oh My Zsh ────────────────────────────────────
install_omz() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        info "Oh My Zsh already installed."
    fi
}

# ── Zsh Plugins ──────────────────────────────────
install_zsh_plugins() {
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # Powerlevel10k
    if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
        info "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            "$ZSH_CUSTOM/themes/powerlevel10k"
    else
        info "Powerlevel10k already installed."
    fi

    # fzf-tab
    if [ ! -d "$ZSH_CUSTOM/plugins/fzf-tab" ]; then
        info "Installing fzf-tab..."
        git clone https://github.com/Aloxaf/fzf-tab \
            "$ZSH_CUSTOM/plugins/fzf-tab"
    else
        info "fzf-tab already installed."
    fi

    # zsh-syntax-highlighting
    if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
        info "Installing zsh-syntax-highlighting..."
        mkdir -p "$HOME/.zsh"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$HOME/.zsh/zsh-syntax-highlighting"
    else
        info "zsh-syntax-highlighting already installed."
    fi
}

# ── Tmux Plugin Manager ─────────────────────────
install_tpm() {
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        info "Installing Tmux Plugin Manager (TPM)..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        info "TPM already installed."
    fi
}

# ── NVM (Node Version Manager) ───────────────────
install_nvm() {
    if [ ! -d "$HOME/.nvm" ]; then
        info "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
    else
        info "NVM already installed."
    fi
}

# ── Symlinks ─────────────────────────────────────
create_symlinks() {
    info "Creating symlinks..."


    local links=(
        "$DOTFILES_DIR/zsh/.zshenv:$HOME/.zshenv"
        "$DOTFILES_DIR/zsh:$HOME/.config/zsh"
        "$DOTFILES_DIR/git:$HOME/.config/git"
        "$DOTFILES_DIR/gitignore:$HOME/.gitignore_global"
        "$DOTFILES_DIR/tmux:$HOME/.config/tmux"
        "$DOTFILES_DIR/nvim:$HOME/.config/nvim"
        "$DOTFILES_DIR/fd:$HOME/.config/fd"
        "$DOTFILES_DIR/bat:$HOME/.config/bat"
        "$DOTFILES_DIR/ghostty:$HOME/.config/ghostty"
        "$DOTFILES_DIR/mango:$HOME/.config/mango"
    )

    for link in "${links[@]}"; do
        local src="${link%%:*}"
        local dst="${link##*:}"

        if [ -e "$dst" ] && [ ! -L "$dst" ]; then
            warn "Backing up existing $(basename "$dst") → ${dst}.bak"
            mv "$dst" "${dst}.bak"
        fi

        ln -sf "$src" "$dst"
        info "  $(basename "$dst") → $(basename "$src")"
    done
}

# ── Default Shell ────────────────────────────────
set_default_shell() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        info "Setting zsh as default shell..."
        chsh -s "$(which zsh)"
    else
        info "zsh is already the default shell."
    fi
}

# ── Main ─────────────────────────────────────────
install_packages
install_omz
install_zsh_plugins
install_tpm
install_nvm
create_symlinks
set_default_shell

echo ""
info "Dotfiles installation complete! 🎉"
echo ""
echo "  Next steps:"
echo "    1. Restart your terminal (or run 'zsh')"
echo "    2. Open tmux and press prefix + I to install tmux plugins"
echo "    3. Open nvim to let lazy.nvim install plugins automatically"
echo "    4. (Optional) Install bun: curl -fsSL https://bun.sh/install | bash"
echo ""
