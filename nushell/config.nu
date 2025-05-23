# Nushell Config File
#
# version = "0.100.1"
use starship.nu
use custom-completions/pre-commit/pre-commit-completions.nu *

source zoxide.nu
source themes/nu-themes/nord.nu
source custom-completions/bat/bat-completions.nu
source custom-completions/btm/btm-completions.nu
source custom-completions/cargo-make/cargo-make-completions.nu
source custom-completions/cargo/cargo-completions.nu
source custom-completions/curl/curl-completions.nu
source custom-completions/docker/docker-completions.nu
source custom-completions/eza/eza-completions.nu
source custom-completions/gh/gh-completions.nu
source custom-completions/git/git-completions.nu
source custom-completions/glow/glow-completions.nu
source custom-completions/make/make-completions.nu
source custom-completions/nix/nix-completions.nu
source custom-completions/npm/npm-completions.nu
source custom-completions/op/op-completions.nu
source custom-completions/pnpm/pnpm-completions.nu
source custom-completions/rustup/rustup-completions.nu
source custom-completions/rg/rg-completions.nu
source custom-completions/ssh/ssh-completions.nu
source custom-completions/tar/tar-completions.nu
source custom-completions/tealdeer/tldr-completions.nu
source custom-completions/typst/typst-completions.nu
source custom-completions/uv/uv-completions.nu
source custom-completions/vscode/vscode-completions.nu
source custom-completions/yarn/yarn-v4-completions.nu
source custom-completions/zellij/zellij-completions.nu

if $nu.is-interactive {
    (fortune-kind | cowsay -f fence -e "oO" -T "U" | clolcat -F 0.2)
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

alias fuck = thefuck $"(history | last 1 | get command | get 0)"

def --env proxy [
    port: int = 7890  # 可选参数，默认端口 7890
] {
    $env.HTTP_PROXY = $"http://127.0.0.1:($port)"
    $env.HTTPS_PROXY = $"http://127.0.0.1:($port)"
    $env.ALL_PROXY = $"http://127.0.0.1:($port)"  # 请替换实际需要忽略的域名
    echo $"🌊 代理已开启 \(端口: ($port)\)"
}

def --env unproxy [] {
    hide-env HTTP_PROXY
    hide-env HTTPS_PROXY
    hide-env ALL_PROXY
    echo "⛔ 代理已关闭"
}
