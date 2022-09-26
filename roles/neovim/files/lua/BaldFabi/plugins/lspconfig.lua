local function init()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(client)
        require 'lsp-format'.on_attach(client)
    end

    require 'lspconfig'.gopls.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.tsserver.setup {
    }
    require 'lspconfig'.pylsp.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.html.setup {
        capabilities = capabilities,
    }
    require 'lspconfig'.cssls.setup {
        capabilities = capabilities,
    }
    require 'lspconfig'.jsonls.setup {
        capabilities = capabilities,
    }
    require 'lspconfig'.sqlls.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.tailwindcss.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.yamlls.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.bashls.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.dockerls.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.eslint.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.ansiblels.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.marksman.setup {
        on_attach = on_attach
    }
    require 'lspconfig'.terraform_lsp.setup {
        on_attach = on_attach
        --
    }
    require 'lspconfig'.sumneko_lua.setup {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
        on_attach = on_attach
    }
end

return {
    init = init
}
