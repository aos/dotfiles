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

ll () {
  opts=("-lFHa") 
  if [[ $(uname) = "Linux" ]]; then
    opts+=("--color")
  fi
  opts+=($@)
  ls "${opts[@]}"
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

# IRC -- to fix weird scrolling
alias irc="TERM=screen-256color irssi"

alias note="vim '+call AppendToLog()'"
