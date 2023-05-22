vim.g.mapleader = " "

require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "navarasu/onedark.nvim" }
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
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { "fatih/vim-go" }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'hrsh7th/cmp-path' },                  -- Required
            { 'hrsh7th/cmp-buffer' },                -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
            { 'saadparwaiz1/cmp_luasnip' },          -- Required
            { 'rafamadriz/friendly-snippets' },      -- Required
        },
        use { "akinsho/toggleterm.nvim", tag = '*' },
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },
        use "windwp/nvim-autopairs",
    }
end)

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

-- move text up and down
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

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>f', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- TREESITTER
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "cpp",
        "c",
        "lua",
        "json",
        "markdown",
        "vim",
        "go",
        "javascript",
        "typescript",
        "rust" },
    highlight = {
        enable = true,
    }
}

-- ONEDARK
require('onedark').setup {
    -- Main options --
    style = 'darker',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true,     -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
}
require('onedark').load()

-- LUALINE
local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local function clock()
    return "" .. os.date("%H:%M")
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    colored = true,
    always_visible = true,
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " ", hint = "ﴞ ", info = " " },
}

local diff = {
    "diff",
    colored = true,
    -- symbols = { added = "+ ", modified = "~ ", removed = "- " }, -- changes diff symbols
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    icon_only = true,
    separator = "",
    padding = { left = 1, right = 0 },
}

local filename = {
    "filename",
    path = 1,
    symbols = { modified = " ~ ", readonly = "", unnamed = "" },
}

local location = {
    "location",
    padding = 0,
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require('lualine').setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "onedark",
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { diagnostics, filetype, filename },
        lualine_x = { diff, spaces, "encoding" },
        lualine_y = { location },
        lualine_z = { "progress", clock },
    },
})

-- AUTOPAIRS
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    enable_check_bracket_line = false,
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
})

-- TERMINAL SETUP
require("toggleterm").setup {
    direction = "horizontal",
    size = 15,
    open_mapping = [[<leader>j]],
    insert_mappings = false,
}

-- LSP
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    -- web
    "html",
    "tsserver",
    "cssls",
    "tailwindcss",
    "eslint",
    "jsonls",
    "marksman",

    -- other
    "gopls",
    "rust_analyzer",
    "bashls",
    "lua_ls",
    "clangd",
})

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
        ['esling'] = { 'javascript', 'typescript' },
        ['cssls'] = { 'css' },
        ['html'] = { 'html' },
        ['jsonls'] = { 'json' },
        ['marksman'] = { 'markdown' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        virtual_text = true,
        underline = false,
    })

vim.opt.background = "dark"
vim.opt.breakindent = true
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.expandtab = true
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
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
