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
          [ -f .gitignore ] && echo .gitignore ;
          # List directories
          fd --type d --hidden --exclude .git
        ]]
            },
        },
    },
})
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files and directories' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = 'Telescope previous buffers' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>pd", function()
  builtin.find_files({
    prompt_title = "Find Directories",
    find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
  })
end, { desc = "Find directories" })
