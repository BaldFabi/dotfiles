local function init()
    require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup {
                    current_line_blame = true,
                    current_line_blame_opts = {
                        delay = 0
                    }
                }
            end
        }

        use {
            'Mofiqul/dracula.nvim',
            config = function()
                require 'dracula'.setup({
                    transparent_bg = true,
                    overrides = {
                        NonText = { fg = require 'dracula'.colors().white }
                    }
                })

                vim.cmd [[colorscheme dracula]]
            end
        }

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
            config = function()
                require 'BaldFabi.plugins.nvim-tree'.init()
            end
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
                require 'BaldFabi.plugins.telescope'.init()
            end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = 'TSUpdate',
            config = function()
                require 'BaldFabi.plugins.treesitter'.init()
            end
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('indent_blankline').setup {
                    show_end_of_line = true,
                    space_char_blankline = " ",
                    show_current_context = true,
                    show_current_context_start = true
                }
            end
        }

        use {
            'preservim/nerdcommenter',
            config = function()
                require 'BaldFabi.plugins.nerdcommenter'.init()
            end
        }

        use 'nvim-treesitter/nvim-treesitter-context'

        use 'mg979/vim-visual-multi'

        use {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require 'colorizer'.setup()
            end
        }

        use {
            'lukas-reineke/lsp-format.nvim',
            config = function()
                require 'lsp-format'.setup {}
            end
        }

        use 'sbdchd/neoformat'

        use {
            'rmagatti/goto-preview',
            config = function()
                require 'BaldFabi.plugins.goto-preview'.init()
            end
        }

        use {
            'hoob3rt/lualine.nvim',
            config = function()
                require 'lualine'.setup {
                    options = {
                        extensions = { 'quickfix' }
                    }
                }
            end
        }

        use {
            'voldikss/vim-floaterm',
            config = function()
                require 'BaldFabi.plugins.floaterm'.init()
            end
        }

        use {
            'folke/trouble.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require 'BaldFabi.plugins.trouble'.init()
            end
        }

        use {
            'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require 'BaldFabi.plugins.diffview'.init()
            end
        }

        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                {
                    'neovim/nvim-lspconfig',
                    config = function()
                        require 'BaldFabi.plugins.lspconfig'.init()
                    end
                },
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-vsnip',
                'hrsh7th/vim-vsnip',
                {
                    'onsails/lspkind-nvim',
                    config = function()
                        require 'lspkind'.init()
                    end
                },
                'ray-x/cmp-treesitter',
                'tzachar/cmp-tabnine'
            },
            config = function()
                require 'BaldFabi.plugins.cmp'.init()
                require 'BaldFabi.plugins.cmp_tabnine'.init()
            end
        }
    end)
end

return {
    init = init
}
