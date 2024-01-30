------------------------------------------------
-- OPTIONS
------------------------------------------------
vim.opt.breakindent = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.expandtab = true
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.guifont = { "FiraCode Nerd Font", "h15" }
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.softtabstop = 2
vim.opt.termguicolors = true

------------------------------------------------
-- KEYMAP
------------------------------------------------
vim.g.mapleader = ' '

-- some
vim.keymap.set("n", "<M-b>", ":Ex<CR>") -- <M-b> = <Alt-b>

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true })

-- file navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>")

-- mjove text up and down
vim.keymap.set("n", "<a-j>", ":m .+1<cr>==", { noremap = true })
vim.keymap.set("n", "<a-k>", ":m .-2<cr>==", { noremap = true })
vim.keymap.set("v", "<a-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<a-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Clear highlights
vim.keymap.set("n", "<leader>h", ":nohl<CR>", { noremap = true })

-- Better paste
vim.keymap.set("v", "p", '"_dp', { noremap = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

------------------------------------------------
-- BOOTSTRAP LAZY.NVIM
------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------
-- PLUGINS
------------------------------------------------
require('lazy').setup({
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'darker',
      })
      require('onedark').load()
    end
  },


  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = {
      auto_install = true,
      ensure_installed = {
        'bash',
        'cpp',
        'c',
        'lua',
        'json',
        'markdown',
        'vim',
        'go',
        'javascript',
        'typescript',
        'rust',
        'python',
      },
      highlight = {
        enable = true,
      },
    },
  },


  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>sf',      '<CMD>Telescope find_files<CR>',                mode = { 'n', 'v' } },
      { '<leader>sw',      '<CMD>Telescope grep_string<CR>',               mode = { 'n', 'v' } },
      { '<leader>sg',      '<CMD>Telescope live_grep<CR>',                 mode = { 'n', 'v' } },
      { '<leader>sd',      '<CMD>Telescope diagnostics<CR>',               mode = { 'n', 'v' } },
      { '<leader><space>', '<CMD>Telescope buffers<CR>',                   mode = { 'n', 'v' } },
      { '<leader>?',       '<CMD>Telescope oldfiles<CR>',                  mode = { 'n', 'v' } },
      { '<leader>/',       '<CMD>Telescope current_buffer_fuzzy_find<CR>', mode = { 'n', 'v' } },
    },
  },


  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        config = true
      }, },
    opts = {
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "onedark",
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype', {
          'datetime',
          style = '%H:%M',
        }, },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      }
    },
  },

  { 'fatih/vim-go' },

  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = "horizontal",
      size = 15,
      open_mapping = [[<leader>j]],
      insert_mappings = false,
    },
  },


  {
    'numToStr/Comment.nvim',
    config = true,
  },


  {
    'windwp/nvim-autopairs',
    opts = {
      check_ts = true,
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
      },
      fast_wrap = {},
    },
  },


  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect
      require('lsp-zero.settings').preset({})
    end,
  },
  --Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-path' },         -- Required
      { 'hrsh7th/cmp-buffer' },       -- Required
      { 'L3MON4D3/LuaSnip' },         -- Required
      { 'saadparwaiz1/cmp_luasnip' }, -- Required
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
      require('lsp-zero.cmp').extend()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action()

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer',  keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end,
  },
  --LSP
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = true,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = true,
        opts = {
          ensure_installed = { 'bashls', 'clangd', 'cssls', 'eslint', 'gopls', 'html', 'jsonls', 'lua_ls', 'marksman',
            'pyright', 'rust_analyzer', 'tailwindcss', 'taplo', 'tsserver', 'yamlls' },
        },
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp = require('lsp-zero')
      local lspconf = require('lspconfig')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      lspconf.lua_ls.setup(lsp.nvim_lua_ls())

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['rust_analyzer'] = { 'rust' },
          ['clangd'] = { 'cpp', 'c' },
          ['bashls'] = { 'bash' },
          ['gopls'] = { 'go' },
          ['eslint'] = { 'javascript', 'typescript' },
          ['cssls'] = { 'css' },
          ['html'] = { 'html' },
          ['jsonls'] = { 'json' },
          ['marksman'] = { 'markdown' },
          ['pyright'] = { 'python' },
          -- if you have a working setup with null-ls
          -- you can specify filetypes it can format.
          -- ['null-ls'] = {'javascript', 'typescript'},

          lsp.setup()
        },
      })
    end
  },
})
