-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
local term_opts = { silent = true }

---------------------
-- General Keymaps
---------------------

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-w>q", ":close<CR>", opts) -- Close window

-- Better buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":Bdelete<CR>", opts) --delete buffer (requires moll/vim-bbye)

-- Better file navigation
keymap("n", "<C-d>", "<C-d>zz", opts) --Down and centralize
keymap("n", "<C-u>", "<C-u>zz", opts) --Up and centralize
-- keymap("i", "jk", "<ESC>", opts) --'jk' fast to exit insert mode

-- Move text up and down
keymap("n", "<a-j>", ":m .+1<cr>==", opts)
keymap("n", "<a-k>", ":m .-2<cr>==", opts)
keymap("v", "<a-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<a-k>", ":m '<-2<CR>gv=gv", opts)

-- Resize with arrows
keymap("n", "<C-up>", ":resize -2<CR>", opts)
keymap("n", "<C-down>", ":resize +2<CR>", opts)
keymap("n", "<C-left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", ":nohl<CR>", opts)

-- Fast save
keymap("n", "<leader>w", ":w<CR>", opts)

-- Better paste
keymap("v", "p", '"_dp', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

---------------------
-- Plugin Keymaps
---------------------

-- Diagnostics
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>q", vim.diagnostic.setloclist)
keymap("n", "<leader>e", vim.diagnostic.open_float)

-- Nvim-Tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope (See `:help telescope.builtin`)
local telescope = require('telescope.builtin')
keymap('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<leader><space>', telescope.buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
	telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
keymap('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Toggleterm
function _G.set_terminal_keymaps()
	vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<c-\><c-n>]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<c-\><c-n>]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<c-\><c-n><c-w>h]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<c-\><c-n><c-w>j]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<c-\><c-n><c-w>k]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<c-\><c-n><c-w>l]], term_opts)
end
vim.cmd("autocmd! termopen term://* lua set_terminal_keymaps()")
