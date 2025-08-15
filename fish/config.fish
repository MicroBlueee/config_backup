if status is-interactive
    # Commands to run in interactive sessions can go here

    # cancel greeting
    set fish_greeting

    # greeting
    set -gx COWPATH ~/.config/cowfile
    fortune-kind | cowsay -f fence -e oO -T U | clolcat -F 0.2

    # Go
    set -gx GOPATH /Users/sushuai/Documents/Code/GoLand
    set -gx GOBIN $GOPATH/bin
    fish_add_path $GOBIN

    # zoxide
    zoxide init fish | source

    # opam configuration
    source /Users/sushuai/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    # rust
    fish_add_path $HOME/.cargo/bin

    # coursier
    # eval "$(cs install --env)"

    # fzf
    fzf --fish | source
    set -g -x FZF_DEFAULT_OPTS "--style full --height 60% --layout=reverse --border --preview 'fzf-preview.sh {}'"

    alias icat="kitty +kitten icat"

    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin $PATH /Users/sushuai/.ghcup/bin # ghcup-env

    # eval (zellij setup --generate-auto-start fish | string collect)

    # starship
    starship init fish | source

    set EDITOR nvim

    set -gx EZA_ICONS_AUTO true

    set -x CONDA_OVERRIDE_OSX (sw_vers -productVersion | string trim)

end

function proxy
    # 参数解析与默认值处理
    set -l port 7890
    if count $argv >/dev/null
        set port $argv[1]
    end

    # 端口有效性验证
    if not string match -qr '^\d+$' -- $port
        echo -s (set_color red) "✖ 端口必须为数字" (set_color normal) >&2
        return 1
    end

    if test $port -lt 1 -o $port -gt 65535
        echo -s (set_color red) "✖ 端口范围需在1-65535之间" (set_color normal) >&2
        return 1
    end

    # 设置全局代理变量
    set -gx http_proxy "http://127.0.0.1:$port"
    set -gx https_proxy "http://127.0.0.1:$port"
    set -gx ALL_PROXY "socks5://127.0.0.1:$port"

    # 彩色状态反馈
    echo -s (set_color cyan) "🌊 代理已启用 | 端口: "(set_color yellow) "$port" (set_color normal)
end

function unproxy
    # 清除所有代理相关环境变量
    set -e http_proxy
    set -e https_proxy
    set -e ALL_PROXY

    # 状态提示
    echo -s (set_color magenta) "⛔ 代理已关闭" (set_color normal)
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function nix-clean

    nix-collect-garbage -d
    nix-collect-garbage --delete-old
    nix-collect-garbage --delete-older-than 1d
    nix-collect-garbage
    nix-store --gc
    nix-store --optimise
    sudo nix-collect-garbage -d
    sudo nix-collect-garbage --delete-old
    sudo nix-collect-garbage --delete-older-than 1d
    sudo nix-collect-garbage
    sudo nix-store --gc
    sudo nix-store --optimise
end

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/usr/local/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/Users/sushuai/.local/share/mamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
