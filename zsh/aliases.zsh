# ── General ──────────────────────────────────────
alias vim="nvim"
alias clr="clear"

# ── Development ──────────────────────────────────
alias rncp="g++ -o cses cses.cpp && ./cses"

# ── WSL-specific (skipped on native Linux) ───────
if grep -qi microsoft /proc/version 2>/dev/null; then
  alias win="cd /mnt/c/Users/shubh"
  alias cava="cava.exe"
fi
