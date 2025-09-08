-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	--    use {
	--        "olimorris/onedarkpro.nvim",
	--        as = "one-dark",
	--        config = function()
	--            require("onedarkpro").setup({
	--                options = {
	--                    transparency = true,
	--                },
	--            })
	--            vim.cmd("colorscheme onedark")
	--        end,
	--    }

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("mbbill/undotree")
	use("mason-org/mason.nvim")
	use("mason-org/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use({
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	})
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})

	use({
		"saghen/blink.cmp",
		requires = {
			"rafamadriz/friendly-snippets",
			"hrsh7th/nvim-cmp", -- optional, for snippet completions
		},
		run = "cargo build --release", -- optional: build native fuzzy matcher from source
		config = function()
			require("blink.cmp").setup({
				keymap = { preset = "default" },
				appearance = {
					-- nerd_font_variant = "mono",
				},
				completion = {
					documentation = {
						auto_show = false,
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = {
					implementation = "prefer_rust_with_warning", -- try native, fallback with warning
				},
			})
		end,
	})
end)
