local utils = require("utils")

-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigate buffers
vim.keymap.set("n", "<C-M-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-M-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Close buffer
-- vim.keymap.set({ "i", "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })

-- LSP formatting
vim.keymap.set("n", "<C-M-f>", function()
    vim.lsp.buf.format({ async = false })
    vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })

-- Toggle options
vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>q", utils.toggle_quickfix, { desc = "Toggle Quickfix Window" })
