# ── General ──────────────────────────────────────
alias vim="nvim"
alias clr="clear"
alias c="clear"
alias f="fastfetch"
alias wlc="wl-copy"
alias wlp="wl-paste"
alias cm="cmatrix"
alias o="xdg-open"

# ── Development ──────────────────────────────────
alias rncp="g++ cses.cpp -o cses && ./cses"

# ── WSL-specific (skipped on native Linux) ───────
if grep -qi microsoft /proc/version 2>/dev/null; then
  alias win="cd /mnt/c/Users/shubh"
  alias cava="cava.exe"
fi

alias lsi='chafa -f kitty --grid=auto --label=on --size=50x25 *.(jpg|jpeg|png|webp|gif|JPG|JPEG|PNG|WEBP|GIF)(.N)'

alias gdb='gdb -q -tui'
alias lsb="ls --color=always | bat"
