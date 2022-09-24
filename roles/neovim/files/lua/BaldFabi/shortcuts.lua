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
    map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', options)
    map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', options)

    map('v', '<Tab>', '> gv', { noremap = true })
    map('v', '<S-Tab>', '< gv', { noremap = true })
end

return {
    init = init
}
