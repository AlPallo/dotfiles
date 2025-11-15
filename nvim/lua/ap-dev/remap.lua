vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Open Oil" })
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.opt.guicursor:append("a:-blinkwait175-blinkoff150-blinkon175")

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "/", "/\\v", { noremap = true })
vim.keymap.set("n", "?", "?\\v", { noremap = true })
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Enter visual block mode" })
vim.keymap.set(
  "v",
  "f",
  "y:let @/='\\V'.escape(@0, '\\')<CR>n",
  { noremap = true, silent = true, desc = "Find selected text" }
)
vim.keymap.set(
  "n",
  "<leader>/",
  ":let @/='\\V'.escape(@\", '\\')<CR>n",
  { noremap = true, silent = true, desc = "Search for last yanked text" }
)
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "n", ":set hlsearch<CR>n", { noremap = true, silent = true })
vim.keymap.set("n", "N", ":set hlsearch<CR>N", { noremap = true, silent = true })
