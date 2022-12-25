local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

--LSPs
mason_lspconfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"html",
		"tsserver",
		"bashls",
		"tailwindcss",
		"emmet_ls",
		"gopls",
		"rust_analyzer",
		"taplo",
	},
	automatic_installation = true,
})

--Linters and formatters
mason_null_ls.setup({
	ensure_installed = {
		--Lua
		"stylua",
		--TS, JS
		"prettier",
		"eslint_d",
		--Golang
		"gofumpt",
		"goimports",
		"goimports_reviser",
		"golines",
		--Rust
		"rustfmt",
	},
	automatic_installation = true,
	automatic_setup = false,
})
