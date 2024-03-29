-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('fidget').setup()
    end
  }

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'joerdav/templ.vim'

  use 'preservim/nerdcommenter'

  use 'christoomey/vim-tmux-navigator'

  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require 'bufferline'.setup {
        options = {
          numbers = "ordinal",
          diagnostics = 'nvim_lsp',
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              seperator = true
            }
          }
        }
      }
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'trouble'.setup {}
    end
  }

  use {
    'folke/todo-comments.nvim',
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require 'todo-comments'.setup {}
    end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require 'nvim-ts-autotag'.setup()
    end
  }

  use {
    'RRethy/vim-illuminate',
    config = function()
      require 'illuminate'.configure({
        delay = 0
      })
    end
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          --['<Tab>'] = cmp.mapping(function(fallback)
          --if cmp.visible() then
          --cmp.select_next_item()
          --else
          --fallback()
          --end
          --end, { 'i', 's' }),
          --['<S-Tab>'] = cmp.mapping(function(fallback)
          --if cmp.visible() then
          --cmp.select_prev_item()
          --elseif luasnip.jumpable(-1) then
          --luasnip.jump(-1)
          --else
          --fallback()
          --end
          --end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "buffer" },
          { name = "path" }
        },
      }
    end
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function()
      require 'treesitter-context'.setup {
        enable = true,
        mode = 'topline'
      }
    end
  }

  use 'lewis6991/gitsigns.nvim'

  use {
    'Mofiqul/dracula.nvim',
    config = function()
      require 'dracula'.setup {
        --transparent_bg = true
      }

      --vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi NormalFloat guibg=NONE ctermbg=NONE')
      --vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
      --vim.cmd('hi TelescopeNormal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi TelescopePreviewNormal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi TelescopePromptNormal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi TelescopeResultsNormal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi NvimTreeNormal guibg=NONE ctermbg=NONE')
      --vim.cmd('hi GitSignsAdd guibg=NONE ctermbg=NONE')
      --vim.cmd('hi GitSignsChange guibg=NONE ctermbg=NONE')
      --vim.cmd('hi GitSignsDelete guibg=NONE ctermbg=NONE')
    end
  }

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v3.*',
    config = function()
      require('ibl').setup {
        indent = {
          char = '┊',
        }
      }
    end
  }
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'      -- Detect tabstop and shiftwidth automatically

  -- Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set('n', '#', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', '-', api.node.open.horizontal, opts('Open:, Horizontal Split'))
        vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      end

      require 'nvim-tree'.setup({
        on_attach = on_attach,
        sort_by = "case_sensitive",
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
        },
        view = {
          side = "left",
        }
      })

      vim.keymap.set('n', '<leader>bb', '<CMD>NvimTreeToggle<CR>', { noremap = false })
    end
  }

  -- Fuzzy Finder (files, lsp, etc)
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
      }
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

    config = function()
      local actions = require("telescope.actions")

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to next result
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
  }

  use {
    "folke/zen-mode.nvim",
    tag = "*",
    opts = {
      width = 100,
      plugins = {
        tmux = { enabled = false }
      }
    },
    config = function()
      vim.keymap.set("n", "<leader>zz", "<CMD>ZenMode<CR>", { noremap = false })
    end
  }


  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.expandtab = true

-- do not wrap lines
vim.o.wrap = false

-- Scrolloff
vim.o.scrolloff = 10

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

vim.o.colorcolumn = '80'

-- Autoformat before writing the file
vim.api.nvim_command(
  'autocmd BufWritePre *.go,*.tf,*.js,*.tsx,*.ts,*.md,*.css,*.scss,*.sass,*.yaml,*.yml,*.json,*.html,*.lua,*.templ :Format')

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>s#', '<CMD>vsplit<CR>', { noremap = false })
vim.keymap.set('n', '<leader>s-', '<CMD>split<CR>', { noremap = false })
vim.keymap.set('n', '<leader>sx', '<CMD>close<CR>', { noremap = false })
vim.keymap.set('n', '<C-e>', '<CMD>wincmd =<CR>', { noremap = false })
vim.keymap.set('n', '+', '<CMD>vertical resize +10<CR>', { noremap = false })
vim.keymap.set('n', '-', '<CMD>vertical resize -10<CR>', { noremap = false })

vim.keymap.set('i', 'jk', '<ESC>', { noremap = false })

vim.keymap.set('n', 'ö', ']m', { noremap = false })
vim.keymap.set('n', 'Ö', '[m', { noremap = false })

-- trouble keybindings
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { noremap = false }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { noremap = false }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { noremap = false }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { noremap = false }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { noremap = false }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { noremap = true }
)

-- buffer switching
vim.keymap.set('n', '<C-n>', '<CMD>bnext<CR>', { noremap = false })
vim.keymap.set('n', '<C-p>', '<CMD>bprevious<CR>', { noremap = false })
vim.keymap.set('n', '<leader>bx', '<CMD>bd<CR>', { noremap = false })

vim.keymap.set('n', '<leader>rr', '<CMD>LspRestart<CR>', { noremap = false })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
    path = 1,
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 0
  },
  numhl = true
}

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  ignore_install = { "help" },
  -- Add languages to be installed here that you want installed for treesitter
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
    'toml',
    'help',
    'vim'
  },

  highlight = { enable = true },
  additional_vim_regex_highlighting = false,
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ['>m'] = '@function.outer',
        ['>>'] = '@class.outer',
      },
      goto_next_end = {
        ['>M'] = '@function.outer',
        ['><'] = '@class.outer',
      },
      goto_previous_start = {
        ['<m'] = '@function.outer',
        ['<<'] = '@class.outer',
      },
      goto_previous_end = {
        ['<M'] = '@function.outer',
        ['<>'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

require('nvim-treesitter.parsers').get_parser_configs().templ = {
  install_info = {
    url = "https://github.com/vrischmann/tree-sitter-templ.git",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "master",
  }
}

vim.treesitter.language.register('templ', 'templ')

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  marksman = {},
  terraformls = {},
  tailwindcss = {
    filetypes = {
      'templ',
      'html'
    },
    init_options = {
      userLanguages = {
        templ = "html"
      }
    }
  },
  yamlls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  templ = {},
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      handlers = handlers,
    }
  end,
}

-- Setup null-ls
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.prettier,
  }
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
