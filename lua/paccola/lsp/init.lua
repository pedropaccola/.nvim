local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "paccola.lsp.mason"
require("paccola.lsp.handlers").setup()
require "paccola.lsp.null-ls"
