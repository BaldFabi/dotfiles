local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    -- map('n', '<C-#>', '<Plug>NERDCommenterToggle<CR>', options)
    -- map('i', '<C-#>', '<Esc><C-#>i', options)
    -- map('v', '<C-#>', '<Plug>NERDCommenterToggle<CR>', options)
    map('n', '<leader>#', '<Plug>NERDCommenterToggle<CR>', options)
    map('v', '<leader>#', '<Plug>NERDCommenterToggle<CR>', options)
end

return {
    init = init
}
