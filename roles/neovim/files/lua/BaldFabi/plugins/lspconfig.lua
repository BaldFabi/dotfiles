local function init()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(client)
        require 'lsp-format'.on_attach(client)
    end

    require 'lspconfig'.gopls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require 'lspconfig'.tsserver.setup {
        capabilities = capabilities,
    }
    require 'lspconfig'.pylsp.setup {
        capabilities = capabilities,
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
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.tailwindcss.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.yamlls.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.bashls.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.dockerls.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.eslint.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.ansiblels.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.marksman.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.terraformls.setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
    require 'lspconfig'.sumneko_lua.setup {
        capabilities = capabilities,
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
