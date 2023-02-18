set E:CPPFLAGS = -I/usr/local/opt/llvm/include
set E:GOPATH = /Users/sushuai/Documents/Code/GoLand
set E:GOROOT = /usr/local/go
set E:GOBIN = $E:GOPATH/bin
set E:JAVA_HOME = /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
set E:CLASSPATH = $E:JAVA_HOME/lib/tools.jar:$E:JAVA_HOME/lib/dt.jar
set E:LDFLAGS = -L/usr/local/opt/llvm/lib

set paths = [/usr/local/bin /usr/bin /bin /usr/sbin /sbin /Users/sushuai/.cargo/bin $E:GOBIN $E:GOROOT/bin /usr/local/sbin /usr/local/anaconda3/bin /Users/sushuai/.ghcup/bin /Users/sushuai/.local/bin /Users/sushuai/.cabal/bin /Users/sushuai/.rbenv/shims /Users/sushuai/.opam/default/bin /usr/local/opt/llvm/bin $E:JAVA_HOME/bin /usr/local/opt/openjdk@8/bin '/Users/sushuai/Library/Application Support/Coursier/bin']

eval (starship init elvish)

eval (zoxide init elvish | slurp)

fortune | cowsay  -f fence -e "oO" -T "λ" | lolcat -F 0.2 -p 2

# fn git {|@a| /usr/local/opt/git/bin/git $@a}

# fn pip3 {|@a| /usr/local/bin/pip3 $@a}

set E:NNN_FIFO = /tmp/nnn.fifo
set E:NNN_PLUG = 'p:preview-tui'

fn n {|@a| e:nnn -H -i -d -D -P p}

set E:FFF_HIDEN = 1
set E:FFF_LS_COLORS = 1

fn proxy {
  set E:https_proxy = http://127.0.0.1:7890
  set E:http_proxy = http://127.0.0.1:7890
  set E:all_proxy = socks5://127.0.0.1:7890
  echo "the proxy is used now"
}

fn noproxy {
  unset-env https_proxy
  unset-env http_proxy
  unset-env all_proxy
  echo "the proxy is off now"
}
