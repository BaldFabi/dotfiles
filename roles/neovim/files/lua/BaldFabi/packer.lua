local function init()
    require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use 'folke/tokyonight.nvim'

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            }
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
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
                require('indent_blankline').setup{
                    show_end_of_line = true,
                    space_char_blankline = " ",
                    show_current_context_start = true
                }
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
            config = function ()
                require 'BaldFabi.plugins.cmp'.init()
                require 'BaldFabi.plugins.cmp_tabnine'.init()
            end
        }
    end)
end

return {
    init = init
}
