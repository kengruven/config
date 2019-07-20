# FOR LOGIN SHELLS

export PS1="\u@\h:\w \\$ "

export LESS="--ignore-case --RAW-CONTROL-CHARS"
export LESSOPEN='|highlight %s'
export HIGHLIGHT_OPTIONS='--out-format xterm256 --style edit-xcode'

# use colors
export CLICOLOR=1

# jsc is installed on OS X, but not in $PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources
fi

# launch services has some important commands (lsregister!)
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$PATH:/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support
fi

# some libraries get upset if you don't make this explicit
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# disable control-D
set -o ignoreeof
