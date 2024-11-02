-- Setup LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable LSP servers
lspconfig.pyright.setup { capabilities = capabilities }      -- Python
lspconfig.ts_ls.setup { capabilities = capabilities }     -- JavaScript/TypeScript
lspconfig.clangd.setup { capabilities = capabilities }       -- C/C++

-- Configure nvim-cmp
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
        max_items=10,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- when you want the full snippet press enter
        ['<C-e>'] = cmp.mapping.confirm{select  = false}, -- when you want just the word that you are typing to be auto completed
    }),
})

-- Load snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

