--Dracula
local dracula_ok, dracula = pcall(require, "dracula")
if not dracula_ok then
	return
end

dracula.setup({
	-- customize dracula color palette
	colors = {
		bg = "#282A36",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		purple = "#BD93F9",
		cyan = "#8BE9FD",
		pink = "#FF79C6",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
		menu = "#21222C",
		visual = "#3E4452",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
	},
	-- use transparent background
	transparent_bg = true, -- default false
	-- set italic comment
	italic_comment = true, -- default false
})

--Tokyonight
local tokyonight_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_ok then
	return
end

tokyonight.setup({
	style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	dim_inactive = false, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
})

--Setting Colorscheme
local colorscheme = "dracula"

local status_color, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_color then
	print("Colorscheme not found")
	return
end
