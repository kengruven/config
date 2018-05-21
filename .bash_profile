# case-insensitive search by default; allow colors
export LESS="-i -R"

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

# disable control-D
set -o ignoreeof
