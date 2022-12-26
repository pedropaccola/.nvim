if vim.g.vscode then
	return
end

require("paccola.plugins")

require("paccola.core.options")
require("paccola.core.keymaps")
require("paccola.core.colorscheme")

require("paccola.plugins.lsp")
require("paccola.plugins.cmp")
require("paccola.plugins.treesitter")
require("paccola.plugins.gitsigns")
require("paccola.plugins.lualine")
require("paccola.plugins.nvim-tree")
require("paccola.plugins.telescope")
require("paccola.plugins.toggleterm")
require("paccola.plugins.bufferline")
require("paccola.plugins.autopairs")
