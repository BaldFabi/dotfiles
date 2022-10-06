local function init()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
            'bash',
            'css',
            'dockerfile',
            'go',
            'gomod',
            'graphql',
            'html',
            'javascript',
            'jsdoc',
            'json',
            'lua',
            'python',
            'tsx',
            'typescript',
            'yaml',
            'cmake',
            'css',
            'hcl',
            'http',
            'make',
            'markdown',
            'regex',
            'rust',
            'ruby',
            'scss',
            'sql',
            'toml'
        },
        highlight = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        indent = {
            enable = true
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil
        }
    }
end

return {
    init = init
}
