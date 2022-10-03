local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    map('n', '<leader>ff', '<CMD>lua require "telescope.builtin".find_files()<CR>', options)
    map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', options)
end

return {
    init = init
}
