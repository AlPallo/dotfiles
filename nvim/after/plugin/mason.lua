require("mason").setup()

local lsp_servers = {
    "lua_ls",
    "pyright",
    "jsonls",
    "bashls",
    "dockerls",
    "yamlls",
    "docker_compose_language_service",
    "spectral",
    "denols",
}

local formatters_and_linters = {
    "prettierd",
    "black",
    "flake8",
    "stylua",
    "shfmt",
    "prettier",
}

local debug_adapters = {
    "debugpy",
}

require("mason-lspconfig").setup({
    ensure_installed = lsp_servers,
    automatic_installation = true,
})

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if ok then
    mason_null_ls.setup({
        ensure_installed = formatters_and_linters,
        automatic_installation = true,
    })
end

local ok_dap, mason_dap = pcall(require, "mason-nvim-dap")
if ok_dap then
    mason_dap.setup({
        ensure_installed = debug_adapters,
        automatic_installation = true,
    })
end

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap

    buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

-- 5. Setup all LSP servers
-- for _, server in ipairs(lsp_servers) do
--     lspconfig[server].setup({
--         on_attach = on_attach,
--     })
-- end

for _, name in ipairs(lsp_servers) do
    vim.lsp.config(name, {
        on_attach = on_attach,
    })
    vim.lsp.enable(name)
end
