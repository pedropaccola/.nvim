local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function clock()
	return "" .. os.date("%H:%M")
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	colored = true,
	always_visible = true,
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", hint = "ﴞ ", info = " " },
}

local diff = {
	"diff",
	colored = true,
	-- symbols = { added = "+ ", modified = "~ ", removed = "- " }, -- changes diff symbols
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icon_only = true,
	separator = "",
	padding = { left = 1, right = 0 },
}

local filename = {
	"filename",
	path = 1,
	symbols = { modified = " ~ ", readonly = "", unnamed = "" },
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require('lualine').setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "onedark",
		component_separators = '|',
		section_separators = '',
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diagnostics, filetype, filename },
		lualine_x = { diff, spaces, "encoding" },
		lualine_y = { location },
		lualine_z = { "progress", clock },
	},
})
