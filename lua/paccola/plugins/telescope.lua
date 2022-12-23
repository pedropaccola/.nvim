local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	return
end

local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {

		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-t"] = trouble.open_with_trouble,
			},
		},
	},
})

telescope.load_extension("fzf")
