local function init()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require 'lspconfig'.gopls.setup{}
    require 'lspconfig'.tsserver.setup{}
    require 'lspconfig'.pylsp.setup{}
    require 'lspconfig'.html.setup{
        capabilities = capabilities
    }
    require 'lspconfig'.cssls.setup{
        capabilities = capabilities
    }
    require 'lspconfig'.jsonls.setup{
        capabilities = capabilities
    }
    require 'lspconfig'.sqlls.setup{}
    require 'lspconfig'.tailwindcss.setup{}
    require 'lspconfig'.yamlls.setup{}
    require 'lspconfig'.bashls.setup{}
    require 'lspconfig'.dockerls.setup{}
    require 'lspconfig'.eslint.setup{}
    require 'lspconfig'.ansiblels.setup{}
    require 'lspconfig'.marksman.setup{}
    require 'lspconfig'.terraform_lsp.setup{}
end

return {
    init = init
}