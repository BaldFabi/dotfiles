local function init()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            --['<Tab>'] = cmp.mapping(function(fallback)
            --if cmp.visible() then
            --cmp.select_next_item()
            --else
            --fallback()
            --end
            --end, { "i", "s" }),
            --['<S-Tab>'] = cmp.mapping(function(fallback)
            --if cmp.visible() then
            --cmp.select_prev_item()
            --else
            --fallback()
            --end
            --end, { "i", "s" }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete()
        }),
        sources = {
            { name = 'cmp_tabnine' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'treesitter' },
            { name = 'vsnip' },
        },
        formatting = {
            format = lspkind.cmp_format({
                maxwidth = 50,
                menu = ({
                    nvim_lsp = "[LSP]",
                    buffer = "[Buffer]",
                    nvim_lua = "[Lua]",
                    treesitter = "[TS]",
                    vsnip = "[VSnip]",
                    cmp_tabnine = "[T9]",
                }),
                with_text = true
            }),
        }
    })

    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    vim.o.completeopt = 'menu,menuone,noselect'
end

return {
    init = init
}
