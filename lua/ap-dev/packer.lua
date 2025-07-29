-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
          'nvim-telescope/telescope.nvim', tag = '0.1.8',
          -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
  }

   use{
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
   }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }
  use( "mbbill/undotree" )

end)
