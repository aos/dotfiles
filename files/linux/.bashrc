# Colorized 'ls' and other things (for darwin)
export CLICOLOR=1

# Do git completion in terminal
source ~/.git-completion.bash

# alacritty completions
[ -f ~/.bash_completion/alacritty ] && source ~/.bash_completion/alacritty

# Aliases
[ -f ~/.aliases.bash ] && source ~/.aliases.bash

# Add nvim to environment
export EDITOR=nvim
# Add terminal name for GPG (used to sign git commits)
export GPG_TTY=$(tty)

# Make 'fzf' respect .gitignore file
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Show git branch
parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Make directory and 'cd' into it
mkcd () {
  mkdir -p -- "$1"
  cd -P -- "$1" || exit
}

# Use # of jobs or a specific character for prompt
prompt_char_test() { [[ "$1" != 0 ]] && echo "$1" || echo ∞; }

# Prompt
TEAL="\[$(tput setaf 045)\]"
YELLOW="\[$(tput setaf 3)\]"
CLEAR="\[$(tput sgr0)\]"
PROMPT_CHAR='$(prompt_char_test \j)'
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PROMPT_CHAR="\u@\h"
fi
PS1="$TEAL[$PROMPT_CHAR]$CLEAR \W$YELLOW\$(parse_git_branch)$CLEAR ≫ "

# Appends history of bash instead of deleting
shopt -s histappend
shopt -s cmdhist # Adjust multiline items to fit on one line
HISTSIZE=1000
HISTFILESIZE=100000
# Ignores commands that start with space and duplicates
HISTCONTROL=ignoreboth
# Ignores the following words in bash history
HISTIGNORE='ls:bg:fg:history*'
HISTTIMEFORMAT='%F %T '

# If readline is being used, this allows re-editing failed history substitution
shopt -s histreedit
shopt -s histverify

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add $GOPATH
export GOPATH=$HOME/code/go
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

# Add ruby and node package managers
command -v goto >/dev/null && eval "$(goto --init)"

## nvm -- this is SLOWWWWWWWWWWW
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(goto --init)
