-- Bootstrapping
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand to reloads neovim after saving this plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Protected call to not error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
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
packer.startup(function(use)
	-- Have Packer manage itself
	use({ "wbthomason/packer.nvim" })

	-- Manager for LSP servers, linters and formatters
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	--
	-- LSP plugins
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "onsails/lspkind.nvim" })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "jayp0521/mason-null-ls.nvim" })

	-- Autocompletion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- File explorer
	use({ --Fuzzy finder
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "akinsho/toggleterm.nvim", tag = "*" }) --Floating terminal
	use({ "nvim-tree/nvim-tree.lua" }) --File explorer

	-- Syntax
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --Syntax highlighting

	-- Text manipulation
	use({ "tpope/vim-commentary" }) --Comment out code
	use({ "windwp/nvim-autopairs" }) --Auto closing quotes, brackets, etc

	-- UI
	use({ "Mofiqul/dracula.nvim" }) --Colorscheme
	use({ "nvim-lualine/lualine.nvim" }) --Status line
	use({ "lewis6991/gitsigns.nvim" }) --Git signs
	use({ "akinsho/bufferline.nvim" }) --Buffer tabs
	use({ "moll/vim-bbye" }) --Close buffers
	use({ "nvim-tree/nvim-web-devicons" }) --Colored icons

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
