local fidget = require 'fidget'
local neodev = require 'neodev'
local lsp_format = require 'lsp-format'

fidget.setup()
neodev.setup()
lsp_format.setup {}

-- Enable autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable keybinds only when lsp server is available
local on_attach = function(client, bufnr)

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	--general keymaps
	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	lsp_format.on_attach(client)
end

-- Enable the following language servers
local servers = {
	html = {},
	tsserver = {},
	bashls = {},
	tailwindcss = {},
	emmet_ls = {},
	gopls = {
		gopls = {
			gofumpt = true,
			usePlaceholders = true,
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrites = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	rust_analyzer = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
	taplo = {},
	-- pyright = {},
	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true, --shows diagnostics after text, false because of float window in on_attach function
	virtual_lines = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		border = "rounded",
		style = "minimal",
		source = "always",
		header = "",
		prefix = "",
	},
})
vim.fn.sign_define("DiagnosticSignError", { name = "DiagnosticSignError", text = "" })
vim.fn.sign_define("DiagnosticSignWarn", { name = "DiagnosticSignWarn", text = "" })
vim.fn.sign_define("DiagnosticSignHint", { name = "DiagnosticSignHint", text = "ﴞ" })
vim.fn.sign_define("DiagnosticSignInfo", { name = "DiagnosticSignInfo", text = "" })

--Mason
require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = vim.tbl_keys(servers),
})
require('mason-lspconfig').setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}
