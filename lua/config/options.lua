-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- See `:help vim.o`
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_altv   = 1 -- change from left splitting to right splitting

vim.opt.mouse          = "a"
vim.opt.clipboard      = "unnamedplus"
vim.opt.undofile       = true -- save undo history
vim.opt.pumheight      = 10   -- pop up menu heigth
vim.opt.swapfile       = false
vim.opt.showmode       = true -- display INSERT/VISUAL...
vim.opt.scrolloff      = 8    -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff  = 8    -- scroll page when cursor is 8 spaces from left/right
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"
vim.opt.termguicolors  = true
vim.opt.foldmethod     = "manual"
vim.opt.updatetime     = 100
vim.opt.timeoutlen     = 300
vim.opt.laststatus     = 2    -- always show statusline
-- vim.opt.syntax         = "on"
vim.opt.splitkeep      = "screen"
vim.opt.fixendofline   = false

vim.opt.ignorecase = true  -- case insensitive
vim.opt.smartcase  = true  -- case sensitive if capital letter in search
vim.opt.hlsearch   = false -- highlight

vim.opt.signcolumn     = "yes"
vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.autoindent  = true
vim.opt.showtabline = 2    -- always show the tab line

vim.opt.wildmode   = "longest:full:full"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.db"
