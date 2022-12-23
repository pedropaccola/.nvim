-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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
keymap("n", "<a-j>", ":m .+1<CR>==", opts)
keymap("n", "<a-k>", ":m .-2<CR>==", opts)

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

-- Plugins
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fs", "<cmd>Telescope git_status<CR>")
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>")
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>")

-- fugitive
keymap("n", "<leader>gd", ":gdiff<CR>")

-- comment
keymap("n", "<leader>k", ":Commentary<CR>")
keymap("v", "<leader>k", ":Commentary<CR>")

-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", opts)
keymap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)

-- dap
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
--keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
--keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
--keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts)
--keymap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opts)
--keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
--keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)
--keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts)
--keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", opts)

-- toggleterm
function _G.set_terminal_keymaps()
	vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<c-\><c-n>]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<c-\><c-n>]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<c-\><c-n><c-w>h]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<c-\><c-n><c-w>j]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<c-\><c-n><c-w>k]], term_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<c-\><c-n><c-w>l]], term_opts)
end
vim.cmd("autocmd! termopen term://* lua set_terminal_keymaps()")
