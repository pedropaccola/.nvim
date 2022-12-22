local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Automatically source and re-compile packer whenever you save this init.lua
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

-- Install your plugins here
packer.startup(function(use)
    -- Have Packer manage itself
    use { 'wbthomason/packer.nvim' }

    -- LSP plugins
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim' }

    -- Autocompletion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'saadparwaiz1/cmp_luasnip' }

    -- Snippets
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}

    -- File explorer
    use {                                                         --Fuzzy finder
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'akinsho/toggleterm.nvim', tag = '*' }                  --Floating terminal
    use { 'nvim-tree/nvim-tree.lua' }                             --File explorer

    -- Git Plugins
    use { 'tpope/vim-fugitive' }                                  --Git wrapper
    use { 'junegunn/gv.vim' }                                     --Git commit browser

    -- Syntax 
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  --Syntax highlighting

    -- Text manipulation
    use { 'tpope/vim-commentary' }                                --Comment out code
    use { 'raimondi/delimitmate' }                                --Auto closing quotes, brackets, etc

    -- UI 
    use { 'Mofiqul/dracula.nvim' }                                --Colorscheme
    use { 'nvim-lualine/lualine.nvim' }                           --Status line
    use { 'lewis6991/gitsigns.nvim' }                             --Git signs
    use { 'akinsho/bufferline.nvim' }                             --Buffer tabs
    use { 'folke/trouble.nvim' }                                  --Errors UI

    if packer_bootstrap then
        require('packer').sync()
    end
end)

