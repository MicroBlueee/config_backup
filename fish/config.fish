if status is-interactive
    # Commands to run in interactive sessions can go here

    # cancel greeting
    set fish_greeting

    # greeting
    set -gx COWPATH ~/.config/cowfile
    fortune-kind | cowsay -f fence -e oO -T U | clolcat -F 0.2

    # Go
    set -g -x GOPATH /Users/sushuai/Documents/Code/GoLand
    set -g -x GOBIN $GOPATH/bin
    fish_add_path $GOBIN
    
    # zoxide
    zoxide init fish | source

    # opam configuration
    source /Users/sushuai/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    # rust
    fish_add_path $HOME/.cargo/bin

    # coursier
    eval "$(cs install --env)"

    # fzf
    fzf --fish | source
    set -g -x FZF_DEFAULT_OPTS "--style full --height 60% --layout=reverse --border --preview 'fzf-preview {}'"

    alias icat="kitty +kitten icat"

    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin $PATH /Users/sushuai/.ghcup/bin # ghcup-env

    # eval (zellij setup --generate-auto-start fish | string collect)

    # starship
    starship init fish | source

end

function proxy
    set -gx https_proxy http://127.0.0.1:7890
    set -gx http_proxy http://127.0.0.1:7890
    set -gx all_proxy socks5://127.0.0.1:7890
    echo "proxy is used now"
end

function noproxy
    set -e http_proxy
    set -e https_proxy
    set -e all_proxy
    echo "proxy is off now"
end



function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/local/Caskroom/miniconda/base/bin/conda
    eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/usr/local/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/usr/local/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/usr/local/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<
