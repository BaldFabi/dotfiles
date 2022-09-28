local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    map('n', '<Space>', '<Nop>', options)
    vim.cmd('let mapleader="\\<Space>"')

    map('n', '<leader>+', '<CMD>vsplit<CR>', options)
    map('n', '<leader>-', '<CMD>split<CR>', options)
    map('n', '<leader><Left>', '<CMD>wincmd h<CR>', options)
    map('n', '<leader><Right>', '<CMD>wincmd l<CR>', options)
    map('n', '<leader><Up>', '<CMD>wincmd k<CR>', options)
    map('n', '<leader><Down>', '<CMD>wincmd j<CR>', options)
    map('n', '=', '<CMD>wincmd =<CR>', options)
    map('n', '+', '<CMD>resize +10<CR>', options)
    map('n', '-', '<CMD>resize -10<CR>', options)
    map('n', '<', '<CMD>vertical resize -10<CR>', options)
    map('n', '>', '<CMD>vertical resize +10<CR>', options)
    map('n', 'r', '<CMD>redo<CR>', options)

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
