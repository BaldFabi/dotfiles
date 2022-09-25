local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    map('n', '<leader>t', '<CMD>NvimTreeToggle<CR>', options)
    map('n', '<leader>j', '<CMD>vsplit<CR>', options)
    map('n', '<leader>k', '<CMD>split<CR>', options)
    map('n', '<leader><Left>', '<CMD>wincmd h<CR>', options)
    map('n', '<leader><Right>', '<CMD>wincmd l<CR>', options)
    map('n', '<leader><Up>', '<CMD>wincmd k<CR>', options)
    map('n', '<leader><Down>', '<CMD>wincmd j<CR>', options)
    map('n', '=', '<CMD>wincmd =<CR>', options)
    map('n', '+', '<CMD>resize +10<CR>', options)
    map('n', '-', '<CMD>resize -10<CR>', options)
    map('n', '<', '<CMD>vertical resize -10<CR>', options)
    map('n', '>', '<CMD>vertical resize +10<CR>', options)
    map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files({hidden=true})<CR>', options)
    map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', options)
    map('n', 'r', '<CMD>redo<CR>', options)

    -- map('n', '<C-#>', '<Plug>NERDCommenterToggle<CR>', options)
    -- map('i', '<C-#>', '<Esc><C-#>i', options)
    -- map('v', '<C-#>', '<Plug>NERDCommenterToggle<CR>', options)
    map('n', '<leader>#', '<Plug>NERDCommenterToggle<CR>', options)
    map('i', '<leader>#', '<Esc><C-#>i', options)
    map('v', '<leader>#', '<Plug>NERDCommenterToggle<CR>', options)

    map('v', '<Tab>', '> gv', options)
    map('v', '<S-Tab>', '< gv', options)

    map('n', '<S-Up>', '<CMD>-10<CR>', options)
    map('n', '<S-Down>', '<CMD>+10<CR>', options)
    map('i', '<S-Up>', '<CMD>-10<CR>', options)
    map('i', '<S-Down>', '<CMD>+10<CR>', options)
    map('v', '<S-Up>', '<CMD>-10<CR>', options)
    map('v', '<S-Down>', '<CMD>+10<CR>', options)
end

return {
    init = init
}
