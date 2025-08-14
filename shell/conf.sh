alias ta="tmux attach"

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
