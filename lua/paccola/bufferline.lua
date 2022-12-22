local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		show_close_icon = true,
		separator_style = "thick",
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Nvim-Tree",
				hightlight = "Directory",
				text_align = "left",
			},
		},
	},
})
