# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

let-env PATH = ($env.PATH | prepend '/usr/local/bin')

# Coursier
let-env PATH = ($env.PATH | append '/Users/sushuai/Library/Application Support/Coursier/bin')
let-env PATH = ($env.PATH | append '/usr/local/opt/openjdk@8/bin')

# Java
let-env JAVA_HOME = '/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home'
let-env PATH = ($env.PATH | append $"($env.JAVA_HOME)/bin")
let-env CLASSPATH = $"$env.JAVA_HOME/lib/tools.jar"
let-env CLASSPATH = ($env.CLASSPATH | append $"($env.JAVA_HOME)/lib/dt.jar")

let-env PATH = ($env.PATH | append '~/.cargo/bin')

# ranger
let-env RANGER_LOAD_DEAFAULT_RC = 'False'

# Go
let-env GOROOT = '/usr/local/opt/go'
let-env GOPATH = '/Users/sushuai/Documents/Code/GoLand'
let-env GOBIN = $'($env.GOPATH)/bin'
let-env PATH = ($env.PATH | append $env.GOBIN)
# let-env PATH = ($env.PATH | append $'($env.GOROOT)/bin')

let-env PATH = ($env.PATH | append '/usr/local/sbin')

let-env PATH = ($env.PATH | append "/usr/local/anaconda3/bin")

let-env PATH = ($env.PATH | append '/Users/sushuai/.ghcup/bin')

let-env PATH = ($env.PATH | append '/Users/sushuai/.local/bin')

let-env PATH = ($env.PATH | append '/Users/sushuai/.cabal/bin')

let-env PATH = ($env.PATH | append '/Users/sushuai/.rbenv/shims')

let-env PATH = ($env.PATH | append '/Users/sushuai/.opam/default/bin/')

let-env PATH = ($env.PATH | append '/usr/local/opt/llvm/bin')
let-env LDFLAGS = "-L/usr/local/opt/llvm/lib"
let-env CPPFLAGS = "-I/usr/local/opt/llvm/include"

zoxide init nushell | save -f ~/.zoxide.nu

# starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

let-env PATH = ($env.PATH | append '/Users/sushuai/.emacs.d/bin')

alias proxy = (let-env http_proxy = "http://127.0.0.1:7890"; let-env https_proxy = "http://127.0.0.1:7890"; let-env all_proxy = "socks5://127.0.0.1:7890"; echo "proxy is used now")
alias noproxy = (hide-env http_proxy ; hide-env https_proxy ; hide-env all_proxy ; echo "proxy is off now")

let-env PATH = ($env.PATH | append '/Applications/IntelliJ IDEA.app/Contents/MacOS')
let-env PATH = ($env.PATH | append '/Applications/CLion.app/Contents/MacOS')
