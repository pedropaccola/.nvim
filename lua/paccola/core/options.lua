local opt = vim.opt

--Line numbers
opt.number = true -- set numbered lines
opt.relativenumber = true

--Tabs and Indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.showtabline = 0 -- always show tabs
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again

--Line wrapping
opt.wrap = true -- display lines as one long line
opt.linebreak = true
opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached

--Search settings
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.hlsearch = true -- highlight all matches on previous search pattern

--Cursor line
opt.cursorline = true -- highlight the current line

--UI
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.background = "dark"
opt.guifont = "Fira Code:h15" -- the font used in graphical neovim applications
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.showmode = false -- lualine does this job
opt.ruler = false -- hide the line and column number of the cursor position
opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}
opt.pumheight = 10 -- pop up menu height

--Backspace
opt.backspace = "indent,eol,start"

--Cliboard
opt.clipboard:append("unnamedplus") -- allows neovim to access the system clipboard

--Split windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

--Backup
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- NEEDS TO BE CATEGORIZED
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fillchars.eob = " " -- show empty lines at the end of a buffer as ` ` {default `~`}
opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
opt.iskeyword:append("-") -- treats words with `-` as single words
opt.laststatus = 3 -- only the last window will always have a status line
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
opt.swapfile = false -- creates a swapfile
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)
