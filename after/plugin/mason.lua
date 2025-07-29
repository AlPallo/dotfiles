require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = false,
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

-- 3. Setup servers with minimal config (add on_attach)
local servers = {
  bashls = {},
  dockerls = {},
  jsonls = {},
  pyright = {},
  yamlls = {},
  spectral = {},
  denols = {},
}

-- 4. Loop through servers and setup
for name, config in pairs(servers) do
  config.on_attach = on_attach
  vim.lsp.enable(name)
end
