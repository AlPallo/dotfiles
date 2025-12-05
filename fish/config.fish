if status is-interactive
set -U __fish_git_prompt_show_informative_status 1
set -U __fish_git_prompt_char_stagedstate "+"
set -U __fish_git_prompt_color_stagedstate green
set -U __fish_git_prompt_char_dirtystate "*"
set -U __fish_git_prompt_color_dirtystate red
set -U __fish_git_prompt_char_cleanstate ""
set -U __fish_git_prompt_char_conflictedstate "!"
set -U __fish_git_prompt_color_conflictedstate red
set -U __fish_git_prompt_color_branch magenta
set -U __fish_git_prompt_char_untrackedfiles "…"
set -U fish_color_cwd white
set -gx EDITOR nvim
set -U fish_greeting ""
set -x MANPAGER "nvim +Man!"
set -gx PGPASSFILE "/home/alex/.pgpass"
  if not set -q TMUX
    if tmux has-session 2>/dev/null
      tmux attach
    else
      tmux new -s main
    end
  end

  function update-nvim
    set NVIM_REPO $HOME/src/neovim

    if not test -d $NVIM_REPO/.git
        echo "Error: No Git repo found at $NVIM_REPO"
        return 1
    end

    cd $NVIM_REPO
    echo "Fetching all tags from origin..."
    git fetch --tags --force
    echo "Checking out stable tag..."

    git checkout -B stable-build tags/stable
    echo "Cleaning old build artifacts..."

    rm -rf build .deps
    echo "Building Neovim..."
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    echo "Installing Neovim..."
    sudo make install
    echo "Neovim update complete!"
    nvim --version
  end
end
