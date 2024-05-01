return { -- nvim-cmp uses luasnip for completion and luasnip uses cmp_luasnip for completion
    {
        "L3MON4D3/LuaSnip",
        dependencies = { 
            "saadparwaiz1/cmp_luasnip",  -- the completion engine
            "rafamadriz/friendly-snippets" -- vscode like snippits collection
        }
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- the snippits engine that been used for others look at the docs
                  end,
                },
                -- window customization
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- keybinding
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                  -- { name = 'nvim_lsp' },
                  { name = 'luasnip' }, -- For luasnip users.
                }, {
                  { name = 'buffer' },
                })
              })
        end
    }
}
