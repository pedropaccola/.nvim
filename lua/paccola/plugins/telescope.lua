-- See `:help telescope` and `:help telescope.setup()`
local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
	["<C-j>"] = actions.move_selection_next,
	["<C-k>"] = actions.move_selection_previous,
	["<C-c>"] = actions.close,
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
