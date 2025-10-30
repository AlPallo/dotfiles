vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Open Oil" })
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.opt.guicursor:append("a:-blinkwait175-blinkoff150-blinkon175")
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "/", "/\\v", { noremap = true })
vim.keymap.set("n", "?", "?\\v", { noremap = true })
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Enter visual block mode" })
vim.keymap.set(
  "n",
  "<leader>fiw",
  "viwy:let @/='\\V'.escape(@0, '\\')<CR>n",
  { noremap = true, silent = true, desc = "Find inner word under cursor" }
)
vim.keymap.set(
  "x",
  "f",
  "y:let @/='\\V'.escape(@0, '\\')<CR>n",
  { noremap = true, silent = true, desc = "Find selected text" }
)
