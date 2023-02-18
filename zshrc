# zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/opt/zsh-git-prompt/zshrc.sh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
eval $(thefuck --alias)
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
fortune | cowsay -f fence -e "oO" -T "ω" | lolcat -F 0.2 -p 2

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

# coursier
export PATH="$PATH:/Users/sushuai/Library/Application Support/Coursier/bin"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

# Ruby
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH:"
export CLASSPATH="$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar"

# cargo
. "$HOME/.cargo/env"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ranger
export RANGER_LOAD_DEFAULT_RC='False'
 
# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# GO
export GOROOT=/usr/local/go
export GOPATH=/Users/sushuai/Documents/Code/GoLand
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin

# QuickQ
# export ALL_PROXY=socks5://127.0.0.1:10010

# Fast Jump zoxide
eval "$(zoxide init zsh)"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(mcfly init zsh)"

source /Users/sushuai/.config/broot/launcher/bash/br

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# lvim
export PATH="/Users/sushuai/.local/bin:$PATH"

export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'

export FFF_HIDEN=1
export FFF_LS_COLORS=1

alias nnn='nnn -H -i -d -D -P p'
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/sushuai/.emacs.d/bin:$PATH"

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
