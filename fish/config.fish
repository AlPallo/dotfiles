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
end
