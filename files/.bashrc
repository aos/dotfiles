# Colorized 'ls' and other things (for darwin)
export CLICOLOR=1

# Do git completion in terminal
source ~/.git-completion.bash

# homebrew completions
[ -f ~/.homebrew_completions.bash ] && source ~/.homebrew_completions.bash

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

# Bash
colors256() {
        local c i j

        printf "Colors 0 to 15 for the standard 16 colors\n"
        for ((c = 0; c < 16; c++)); do
                printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
        done
        printf "|\n\n"

        printf "Colors 16 to 231 for 256 colors\n"
        for ((i = j = 0; c < 232; c++, i++)); do
                printf "|"
                ((i > 5 && (i = 0, ++j))) && printf " |"
                ((j > 5 && (j = 0, 1)))   && printf "\b \n|"
                printf "%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
        done
        printf "|\n\n"

        printf "Greyscale 232 to 255 for 256 colors\n"
        for ((; c < 256; c++)); do
                printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
        done
        printf "|\n"
}

# Use # of jobs or a specific character for prompt
prompt_char_test() { [[ "$1" != 0 ]] && echo "$1" || echo ∞; }

# Prompt
TEAL="\[$(tput setaf 045)\]"
YELLOW="\[$(tput setaf 142)\]"
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

# Add qt5.5
export PATH="/Users/adabbagh/Qt5.5.0/5.5/clang_64/bin:$PATH"

# Add $GOPATH
export GOPATH=$HOME/Desktop/code/go
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

# Add ruby and node package managers
## rbenv --> ruby version manager
command -v rbenv >/dev/null && eval "$(rbenv init -)"

command -v goto >/dev/null && eval "$(goto --init)"

## nvm -- this is SLOWWWWWWWWWWW
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

