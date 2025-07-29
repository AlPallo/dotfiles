 function ColorMeSilly(color)
 	color = color or "onedark"
 	vim.cmd.colorscheme(color)
 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
 	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
 	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
 	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
 	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
 end
 ColorMeSilly()
 
