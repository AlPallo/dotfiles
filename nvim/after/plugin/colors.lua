function ColorMeSilly(color)
	-- color = color or "onedark"
	-- color = color or "nord"
	color = color or "onenord"
	vim.diagnostic.config({
		float = {
			header = false,
			border = "rounded",
			focusable = true,
		},
	})
	vim.o.termguicolors = true
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#171717" }) -- dark gray
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#808080" }) -- optional border color
	vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "#3c3c3c" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = "#3c3c3c" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = "#3c3c3c" })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = "#3c3c3c" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "TelescopePreviewLine", { bg = "#4c566a", fg = "none" })
end

ColorMeSilly()
