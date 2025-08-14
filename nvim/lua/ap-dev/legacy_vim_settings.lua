vim.o.laststatus = 2
vim.o.statusline = "%f %h%m%r%=%-14.(%l,%c%V%) %P"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.opt.shortmess:remove('S')
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.scrolloff = 999


vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml,yml,sh,bashrc",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
