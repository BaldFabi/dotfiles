local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = true }

    map('n', '<leader>k9', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 k9s<CR>', options)
    map('n', '<leader>sh', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)

    map('n', '<F12>', '<CMD>FloatermToggle<CR>', options)
    map('i', '<F12>', '<CMD>FloatermToggle<CR>', options)
    map('v', '<F12>', '<CMD>FloatermToggle<CR>', options)
    map('t', '<F12>', '<CMD>FloatermToggle<CR>', options)
    map('n', '<F8>', '<CMD>FloatermPrev<CR>', options)
    map('i', '<F8>', '<CMD>FloatermPrev<CR>', options)
    map('v', '<F8>', '<CMD>FloatermPrev<CR>', options)
    map('t', '<F8>', '<CMD>FloatermPrev<CR>', options)
    map('n', '<F9>', '<CMD>FloatermNext<CR>', options)
    map('i', '<F9>', '<CMD>FloatermNext<CR>', options)
    map('v', '<F9>', '<CMD>FloatermNext<CR>', options)
    map('t', '<F9>', '<CMD>FloatermNext<CR>', options)
end

return {
    init = init
}
