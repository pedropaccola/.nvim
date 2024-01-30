-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({

  {
		'neoclide/coc.nvim',
		branch = 'release',
		event = 'VeryLazy',
	},

  -- :help ctrp-mappings
  { "ctrlpvim/ctrlp.vim" },

  {
    'github/copilot.vim', 
    event = 'VeryLazy',
  },

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'mrquantumcodes/bufferchad.nvim',
    config = function()
      require('bufferchad').setup({
        mapping = "q", -- Map any key, or set to NONE to disable key mapping
        mark_mapping = "<leader>bm", -- The keybinding to display just the marked buffers
        order = "LAST_USED_UP", -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
        style = "default", -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
        close_mapping = "q", -- only for the default style window. 
      })
      end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { 'numToStr/Comment.nvim', opts = {} },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

vim.o.termguicolors   = true
vim.opt.title         = true -- show title
vim.opt.syntax        = "ON"
vim.opt.showtabline   = 2    -- always show the tab line
vim.opt.scrolloff     = 8    -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8    -- scroll page when cursor is 8 spaces from left/right
vim.opt.laststatus    = 2    -- always show statusline
vim.opt.signcolumn    = "auto"
vim.opt.expandtab     = false
vim.opt.clipboard     = "unnamedplus"
vim.cmd('filetype plugin on') -- set filetype
vim.cmd('set wildmenu')       -- enable wildmenu

-- Set tab size to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set line numbers to always be on and use relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.foldmethod = "manual"

-- Set autoindent to always true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Change netrw settings
vim.g.netrw_banner = 0   -- gets rid of the annoying banner for netrw
vim.g.netrw_altv = 1   -- change from left splitting to right splitting

-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300


-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap Alt+Shift+F to format using Coc
vim.api.nvim_set_keymap('n', '<A-S-F>', [[:call CocActionAsync('format')<CR>]], { noremap = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
