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

  use({
    "olimorris/onedarkpro.nvim",
    as = "one-dark",
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true,
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  })

  use("shaunsingh/nord.nvim")
  use("rmehri01/onenord.nvim")

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
    "benomahony/oil-git.nvim",
    requires = { "stevearc/oil.nvim" },
  })
  use("nvim-tree/nvim-web-devicons")
  use("MunifTanjim/nui.nvim")
  use({
    "folke/noice.nvim",
    requires = { "MunifTanjim/nui.nvim" },
  })
  use("tpope/vim-fugitive")
  use({
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  })

  use({
    "saghen/blink.cmp",
    requires = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/nvim-cmp",
    },
    run = "cargo build --release", -- optional: build native fuzzy matcher from source
    config = function()
      require("blink.cmp").setup({
        keymap = { preset = "default" },
        appearance = {
          nerd_font_variant = "mono",
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
        signature = {
          enabled = true,
        },
        cmdline = {
          keymap = { preset = "inherit" },
          completion = { menu = { auto_show = true } },
        },
      })
    end,
  })
end)
