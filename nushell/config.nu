# Nushell Config File
#
# version = "0.100.1"
use starship.nu
use custom-completions/pre-commit/pre-commit-completions.nu *

source zoxide.nu
source themes/nord.nu
source custom-completions/auto-generate/parse-help.nu
source custom-completions/btm/btm-completions.nu
source custom-completions/cargo-make/cargo-make-completions.nu
source custom-completions/cargo/cargo-completions.nu
source custom-completions/curl/curl-completions.nu
source custom-completions/docker/docker-completions.nu
source custom-completions/gh/gh-completions.nu
source custom-completions/git/git-completions.nu
source custom-completions/glow/glow-completions.nu
source custom-completions/make/make-completions.nu
source custom-completions/npm/npm-completions.nu
source custom-completions/pnpm/pnpm-completions.nu
source custom-completions/rustup/rustup-completions.nu
source custom-completions/tealdeer/tldr-completions.nu
source custom-completions/typst/typst-completions.nu
source custom-completions/vscode/vscode-completions.nu
source custom-completions/yarn/yarn-v4-completions.nu
source custom-completions/zellij/zellij-completions.nu
source custom-completions/rg/rg-completions.nu

if $nu.is-interactive {
  (fortune | cowsay -f fence -e "oO" -T "ω" | lolcat -F 0.2 -p 2)
}

$env.config = {
    show_banner: false
    edit_mode: Vi 
    table:{
        mode: basic_compact
        }
}

$env.config.plugins = {
    helights: {
        true_colors: true
        helights.theme: 'Nord'
    }
}
