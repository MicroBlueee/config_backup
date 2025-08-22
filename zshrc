# zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
#export PROMPT="%{%F{blue}%}%n🥬$reset_color @ %{%F{green}%}%1~
#%{$reset_color%}> "
#export RPROMPT="[%{%F{cyan}%}%B%?%{$reset_color]%}"

# opam configuration
[[ ! -r /Users/sushuai/.opam/opam-init/init.zsh ]] || source /Users/sushuai/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# ghcup-env
[ -f "/Users/sushuai/.ghcup/env" ] && source "/Users/sushuai/.ghcup/env" # ghcup-env

# cowsay
export COWPATH="$HOME/.config/cowfile/"
fortune-kind | cowsay -f fence -e "oO" -T "ω" | clolcat -F 0.2

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

source /run/current-system/sw/share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh

# coursier
export PATH="$PATH:/Users/sushuai/Library/Application Support/Coursier/bin"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--style full --height 60% --layout=reverse --border --preview 'fzf-preview.sh {}'"

# GO
export GOPATH=/Users/sushuai/Documents/Code/GoLand
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PATH="/usr/local/sbin:$PATH"

set -o vi 

export PATH="~/.bun/bin:$PATH"

export EZA_ICONS_AUTO=true

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function proxy() {
    # 参数处理逻辑
    local port=${1:-7890}

    # 端口验证
    if ! [[ "$port" =~ ^[0-9]+$ ]]; then
        echo "✖ 无效端口类型: 必须为数字" >&2
        return 1
    fi
    if (( port < 1 || port > 65535 )); then
        echo "✖ 端口越界: 需在1-65535之间" >&2
        return 1
    fi

    # 设置代理变量
    export http_proxy="http://127.0.0.1:$port"
    export https_proxy="http://127.0.0.1:$port"
    export ALL_PROXY="socks5://127.0.0.1:$port"
    
    # 状态反馈
    echo "🌐 代理已激活 | 端口: $port"
}

function unproxy() {
    # 清除所有代理变量
    unset http_proxy https_proxy ALL_PROXY
    
    # 状态提示
    echo "🛑 代理已关闭"
}

export CONDA_OVERRIDE_OSX="$(sw_vers -productVersion)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/usr/local/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/sushuai/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

