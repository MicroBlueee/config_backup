if status is-interactive
    # Commands to run in interactive sessions can go here

    # cancel greeting
    set fish_greeting

    # greeting
    fortune | cowsay -f fence -e oO -T U | lolcat -F 0.2 -p 2

    # Java
    set JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
    set CLASSPATH $JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
    fish_add_path $JAVA_HOME/bin

    eval "$(/usr/local/bin/brew shellenv)"

    # Go
    set GOROOT /usr/local/opt/go/libexec/
    set -g -x GOPATH /Users/sushuai/Documents/Code/GoLand
    set -g -x GOBIN $GOPATH/bin
    fish_add_path $GOBIN
    fish_add_path $GOROOT/bin

    fish_add_path Users/sushuai/.ghcup/bin
    fish_add_path Users/sushuai/.cabal/bin

    # opam configuration
    source /Users/sushuai/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    # rbenv
    status --is-interactive; and rbenv init - fish | source

    # pyenv
    pyenv init - | source

    # rust
    fish_add_path $HOME/.cargo/bin

    # coursier
    eval "$(cs install --env)"

    # ranger
    set -g -x RANGER_LOAD_DEFAULT_RC False

    # fzf
    set -g -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'

    # llvm
    fish_add_path /usr/local/opt/llvm/bin
    # set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
    # set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

    alias icat="kitty +kitten icat"

    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin $PATH /Users/sushuai/.ghcup/bin # ghcup-env

    # autojump  
    zoxide init fish | source

    # eval (zellij setup --generate-auto-start fish | string collect)

    starship init fish | source

    set -gx CHEAT_USE_FZF true

    # Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {} || viu {}) 2> /dev/null | head -200'"

    set -gx NVM_DIR "$HOME/.nvm"

    fish_add_path /Applications/IntelliJ\ IDEA.app/Contents/MacOS
    fish_add_path /Applications/CLion.app/Contents/MacOS

    set -gx PNPM_HOME /Users/sushuai/Library/pnpm
    fish_add_path $PNPM_HOME

    set -gx ETH_RPC_URL "https://eth-mainnet.g.alchemy.com/v2/c9ouypKBKIlNYltuNQ_fU92ln83TZReW"
    # set -gx ETH_RPC_URL https://rpc.ankr.com/arbitrum/7127b9264e0043d99c4495803f5ff25a6655bd3d8e8eccb13ae0221856661b8c
    set -gx ETHERSCAN_API_KEY TN5NIU7K7M58Y8RS4SAEQUQPPGMBWCD2VV

    fish_add_path ~/.local/share/solana/install/active_release/bin

    fish_add_path /Library/TeX/texbin

    # brew
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

end

# Add this to you config.fish or equivalent.
# Fish don't support recursive calls so use f function
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
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

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
