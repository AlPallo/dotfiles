local builtin = require("telescope.builtin")
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			height = 0.95, -- occupy most of the screen vertically
			width = 0.8, -- keep some margins on the sides
			preview_cutoff = 1, -- always show preview (never hide due to width)
			preview_height = 0.5, -- preview takes up half of the window height
		},
	},
	pickers = {
		find_files = {
			hidden = false, -- default is fine
			find_command = {
				"sh",
				"-c",
				[[
          rg --files --no-ignore --hidden \
             --glob '!**/.*' \
             --glob '!**/venv/*' ;
          [ -f .env ] && echo .env
          [ -f .gitignore ] && echo .gitignore ;
          # List directories
          fd --type d --hidden --exclude .git
        ]],
			},
		},
	},
})
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files and directories" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Telescope previous buffers" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
    vim.wo.wrap = true
		if vim.bo.filetype ~= "help" then
			vim.wo.number = true
		end
	end,
})

vim.keymap.set("n", "<leader>pd", function()
	builtin.find_files({
		prompt_title = "Find Directories",
		find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
	})
end, { desc = "Find directories" })
