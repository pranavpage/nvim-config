local lsp = require('lsp-zero')

lsp.preset('recommended')
require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,  -- Automatically install LSP servers
  ensure_installed = {
    'pylsp',  -- For Python
    'clangd',    -- For C++
    'lua_ls', -- For Lua
  }
})
local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings{
['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
['<C-y>'] = cmp.mapping.confirm({select = true}),
["<C-Space>"] = cmp.mapping.complete(),
}
require'lspconfig'.pylsp.setup{}
lsp.setup()
