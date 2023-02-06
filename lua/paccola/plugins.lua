-- Bootstrapping
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
	vim.cmd [[packadd packer.nvim]]
end

-- Have packer use a popup window
require('packer').init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- Install your plugins here
require('packer').startup(function(use)
	-- Have Packer manage itself
	use 'wbthomason/packer.nvim'

	-- LSP Configuration and plugins
	use {
		'neovim/nvim-lspconfig',
		requires = {
			--Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			--Useful status updates for LSP
			'j-hui/fidget.nvim',

			--Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',

			--VSCode-like pictograms
			'onsails/lspkind.nvim',

			--Formatter on save
			'lukas-reineke/lsp-format.nvim'
		},
	}

	--Autocompletion	
	use {
		'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}

	-- File explorer
	use { 'nvim-telescope/telescope.nvim', tag = "0.1.0", requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make", cond = vim.fn.executable 'make' == 1 }
	use { 'akinsho/toggleterm.nvim', tag = "*" } --Floating terminal
	use 'nvim-tree/nvim-tree.lua' --File explorer

	-- Syntax highlight, edit and navigation
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	-- Text manipulation
	use 'numToStr/Comment.nvim' --Comment out code
	use 'windwp/nvim-autopairs' --Auto closing quotes, brackets, etc
	use 'tpope/vim-sleuth' --Detect tabstop and shiftwidth automatically
	use 'lukas-reineke/indent-blankline.nvim' --Add indentation guides even to blanklines

	-- UI
	--use 'Mofiqul/dracula.nvim' --Colorscheme
	use 'navarasu/onedark.nvim' --Colorscheme
	use 'nvim-lualine/lualine.nvim' --Status line
	use 'akinsho/bufferline.nvim' --Buffer tabs
	use 'moll/vim-bbye' --Close buffers
	use 'nvim-tree/nvim-web-devicons' --Colored icons

	-- Git related
	use 'lewis6991/gitsigns.nvim' --Git signs
	use 'tpope/vim-fugitive' --Git wrapper
	use 'tpope/vim-rhubarb' --more fugitive features

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if is_bootstrap then
		require("packer").sync()
	end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
