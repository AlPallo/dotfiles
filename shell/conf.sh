alias ta="tmux attach"

# Load git prompt helper (comes with git)
if [ -f /etc/bash_completion.d/git-prompt ]; then
    . /etc/bash_completion.d/git-prompt
elif [ -f /usr/share/git/completion/git-prompt.sh ]; then
    . /usr/share/git/completion/git-prompt.sh
fi

# Configure git prompt behavior
export GIT_PS1_SHOWDIRTYSTATE=1   # show * and + for unstaged/staged changes
export GIT_PS1_SHOWCOLORHINTS=1   # colorize branch name

PS1='\[\033[01;32m\]\u\[\033[01;37m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

open_nvim() {
  local old_dir=$(pwd)
  if [ "$#" -eq 0 ]; then
    /usr/local/bin/nvim .
  elif [ -d "$1" ]; then
    cd "$1" && /usr/local/bin/nvim .
  else
    /usr/local/bin/nvim "$@"
  fi
  cd "$old_dir"
}

vi() {
  open_nvim "$@"
}

vim() {
  open_nvim "$@"
}

nvim() {
  vi "$@"
}

export MANPAGER="nvim +Man!"

alias python="python3"
