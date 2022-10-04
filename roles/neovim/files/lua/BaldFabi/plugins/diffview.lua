local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = true }

    map('n', '<leader>dvo', '<CMD>DiffviewOpen<CR>', options)
    map('n', '<leader>dvc', '<CMD>DiffviewClose<CR>', options)
end

return {
    init = init
}
