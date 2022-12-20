require('fidget').setup()

-- Mason
require("mason").setup()

local lsp = require('lsp-zero')
lsp.preset('recommended')

-- disable defaults mappings
lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with gitub/copilot plugin
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
  SetCustomLspMappings(bufnr)
end)

lsp.nvim_workspace()
lsp.setup()
