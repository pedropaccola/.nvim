local M = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
        local colors = require("utils").git_colors
		return {
			style = "dark",
            highlights = {
                GitSignsAdd = {fg = colors.GitAdd},
                GitSignsChange = {fg = colors.GitChange},
                GitSignsDelete = {fg = colors.GitDelete},
            }
		}
	end,
	config = function(_, opts)
		local onedark = require("onedark")
		onedark.setup(opts)
		onedark.load()
	end,
}

return M
