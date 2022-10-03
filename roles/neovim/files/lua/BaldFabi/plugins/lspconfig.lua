local function goimports(timeout_ms)
    timeout_ms = timeout_ms or 1000

    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    for _, res in pairs(result) do
        for _, r in pairs(res.result or {}) do
            if r.edit and not vim.tbl_isempty(r.edit) then
                vim.lsp.util.apply_workspace_edit(r.edit, 'UTF-8')
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end

    vim.lsp.buf.formatting_sync(nil, timeout_ms)
end

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
    require 'lspconfig'.terraform_lsp.setup {
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
    init = init,
    goimports = goimports
}
