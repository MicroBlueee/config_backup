# zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
#export PROMPT="%{%F{blue}%}%n🥬$reset_color @ %{%F{green}%}%1~
#%{$reset_color%}> "
#export RPROMPT="[%{%F{cyan}%}%B%?%{$reset_color]%}"

# opam configuration
[[ ! -r /Users/sushuai/.opam/opam-init/init.zsh ]] || source /Users/sushuai/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# ghcup-env
[ -f "/Users/sushuai/.ghcup/env" ] && source "/Users/sushuai/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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

# coursier
export PATH="$PATH:/Users/sushuai/Library/Application Support/Coursier/bin"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH:"
export CLASSPATH="$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# GO
export GOROOT=/usr/local/opt/go/libexec/
export GOPATH=/Users/sushuai/Documents/Code/GoLand
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin

# QuickQ
# export ALL_PROXY=socks5://127.0.0.1:10010


# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# lvim
export PATH="/Users/sushuai/.local/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

set -o vi 

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {} || viu {}) 2> /dev/null | head -200'"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# proxy function
proxy () {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
  echo "Network Proxy on"
}

noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "Network Proxy off"
}

# homebrew自动补全
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH="$PATH:/Applications/CLion.app/Contents/MacOS"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# pnpm
export PNPM_HOME="/Users/sushuai/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:/Users/sushuai/.foundry/bin"

export ETH_RPC_URL="https://eth-mainnet.g.alchemy.com/v2/c9ouypKBKIlNYltuNQ_fU92ln83TZReW"
export ETHERSCAN_API_KEY="TN5NIU7K7M58Y8RS4SAEQUQPPGMBWCD2VV"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

export PATH="~/.bun/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
