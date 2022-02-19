# Aliases
alias vim=nvim
alias py=python3

# For running scheme files outside of REPL
scm () {
  if [[ -z $1 ]]; then
    rlwrap -r -c -f "$HOME"/Desktop/Courses/SICP/scheme_completion.txt mit-scheme
  else
    mit-scheme --quiet < $1
  fi
}

color () {
  if [ "$#" -ne 1 ]; then
    echo "Usage:
    color <temperature>"
    return
  fi

  gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "$1"
}

# Colorized ls is best ls
# -l  long format
# -F  displays ('/', '*', '@', etc.) after certain paths
# -G  colorized output (on darwin)
# -h  use unit suffixes (Byte, Kilobyte, etc.)
# -a  dirs with ('.')
ls --color=auto &> /dev/null && alias ls='ls -F --color=auto' || alias ls='ls -F'

# For pushd and popd
alias dirs="dirs -v"

# Colorized grep
alias grep='grep --color'

# More readable stat output
#alias stat="stat -x"

# Make bash speak in tongues, reverse it with "reset"
alias summon="echo -e '\x1b(0'"

# Make sure ssh works with tmux terminal
alias ssh="TERM=xterm-256color ssh"

alias note="vim '+call AppendToLog()'"

alias open="xdg-open"

alias ag="ag --path-to-ignore ~/.ignore"

alias less="/usr/share/nvim/runtime/macros/less.sh"
