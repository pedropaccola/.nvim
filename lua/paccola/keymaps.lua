-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local opts2 = {silent = true, noremap = true}

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Fast save
keymap("n", "<leader>w", ":w<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bd<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
keymap('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep' })
keymap('n', '<leader>fs', require('telescope.builtin').git_status, { desc = '[F]ind [G]it status' })
keymap('n', '<leader>fh', require('telescope.builtin').oldfiles, { desc = '[F]ind [H]istory' })
keymap('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind [B]uffers' })
keymap('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
keymap('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })

-- Fugitive
keymap("n", "<leader>gd", ":Gdiff<CR>")

-- Comment
keymap("n", "<leader>k", ":Commentary<cr>")
keymap("v", "<leader>k", ":Commentary<cr>")

-- Troule
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts2)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts2)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts2)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts2)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts2)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts2)

-- DAP
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
--keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
--keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
--keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
--keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
--keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
--keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
--keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
--keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp - set lsp mappings in callback
function SetCustomLspMappings (bufnr)
  keymap('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition'} )
  keymap('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences'})
  keymap('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation'})
  keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc =  'Type [D]efinition' })
  keymap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc =  '[D]ocument [S]ymbols' })
  keymap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc =  '[W]orkspace [S]ymbols' })
  keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction'})
  keymap('n', "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat current buffer" })

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end
