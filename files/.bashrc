# Do git completion in terminal
source ~/.git-completion.bash

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
HISTFILESIZE=100000
HISTSIZE=100000
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

# nvm --> node version manager
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rbenv --> ruby version manager
eval "$(rbenv init -)"

# Add qt5.5
export PATH="/Users/adabbagh/Qt5.5.0/5.5/clang_64/bin:$PATH"

