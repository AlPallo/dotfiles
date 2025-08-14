local builtin = require('telescope.builtin')
require("telescope").setup({
  pickers = {
    find_files = {
      hidden = false, -- default is fine
      find_command = {
        "sh", "-c",
        [[
          rg --files --no-ignore --hidden \
             --glob '!**/.*' \
             --glob '!**/venv/*' ;
          [ -f .env ] && echo .env
          [ -f .gitignore ] && echo .gitignore
        ]]
      },
    },
  },
})
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

