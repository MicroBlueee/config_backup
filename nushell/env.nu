# Nushell $environment Config File

# version = 0.100.0

def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_segment = if (is-admin) {
        $"(ansi red_bold)($dir)"
    } else {
        $"(ansi green_bold)($dir)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | format date '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are $environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how $environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.$env_CONVERSIONS = {
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
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added

$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# Java
$env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home'
$env.CLASSPATH = ($env.JAVA_HOME ++ '/lib/tools.jar')
$env.CLASSPATH = $env.CLASSPATH | append ($env.JAVA_HOME ++ '/lib/dt.jar')

$env.CARGO_HOME = ($env.HOME ++ '/.cargo')

# ranger
$env.RANGER_LOAD_DEAFAULT_RC = 'False'

# Go
$env.GOROOT = '/usr/local/opt/go'
$env.GOPATH = ($env.HOME + '/Documents/Code/GoLand')
$env.GOBIN = ($env.GOPATH ++ '/bin')

$env.COWPATH = ($env.HOME ++ '/.config/cowfile')

# LLVM
$env.LDFLAGS = '-L/usr/local/opt/llvm/lib'
$env.CPPFLAGS = '-I/usr/local/opt/llvm/include'

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-$env PATH = ($$env.PATH | split row (char esep) | prepend '/some/path')
$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend /usr/local/bin
    | append /usr/local/sbin
    | append /run/current-system/sw/bin/
    | append /usr/local/anaconda3/bin
    | append ($env.HOME ++ '/.ghcup/bin')
    | append ($env.HOME ++ '/.local/bin')
    | append ($env.HOME ++ '/.cabal/bin')
    | append ($env.HOME ++ '/.rbenv/shims')
    | append ($env.HOME ++ '/.pyenv/shims')
    | append ($env.HOME ++ '/.opam/default/bin')
    | append /usr/local/opt/llvm/bin
    | append /usr/local/opt/coreutils/libexec/gnubin
    # Coursier
    | append ($env.HOME ++ '/Library/Application Support/Coursier/bin')
    | append /usr/local/opt/openjdk@8/bin
    | append ($env.GOBIN)
    | append ($env.JAVA_HOME ++ "/bin")
    | append ($env.CARGO_HOME ++ "/bin")
    )

def proxy [] {
  $env.http_proxy = "http://127.0.0.1:7890"
  $env.https_proxy = "http://127.0.0.1:7890"
  $env.all_proxy = "socks5://127.0.0.1:7890"
  echo "proxy is used now"
}
def noproxy [] {
  hide-$env http_proxy
  hide-$env https_proxy
  hide-$env all_proxy
  echo "proxy is off now"
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
