require("mason").setup()
local lsp_servers = {
	"lua_ls",
	"pyright",
	"jsonls",
	"bashls",
	"dockerls",
	"yamlls",
	"docker_compose_language_service",
	"denols",
	"ansiblels",
    "nil_ls"
}

local formatters_and_linters = {
	"prettierd",
	"black",
	"flake8",
	"stylua",
	"shfmt",
	"prettier",
    "nixfmt"
}

local debug_adapters = {
	"debugpy",
}

require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})

local function is_installed(package)
	local registry_ok, registry = pcall(require, "mason-registry")
	if not registry_ok then
		return false
	end
	if not registry.is_installed then
		return false
	end
	local pkg = registry.get_package(package)
	return pkg:is_installed()
end

for _, tool in ipairs(formatters_and_linters) do
	if not is_installed(tool) then
		vim.schedule(function()
			vim.cmd("MasonInstall " .. tool)
		end)
	end
end

for _, adapter in ipairs(debug_adapters) do
	if not is_installed(adapter) then
		vim.schedule(function()
			vim.cmd("MasonInstall " .. adapter)
		end)
	end
end

local lspconfig = require("lspconfig")

lspconfig["ansiblels"].setup({
	filetypes = { "yaml", "yml", "ansible" },
	root_dir = lspconfig.util.root_pattern("roles", "playbooks"),
})

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local buf_set_keymap = vim.api.nvim_buf_set_keymap

	buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shfmt,
	},
	on_attach = on_attach,
})

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
