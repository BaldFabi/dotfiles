local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    require 'goto-preview'.setup {
        height = 20
    }

    map('n', '<leader>d', '<CMD>lua require("goto-preview").goto_preview_definition()<CR>', options)
end

return {
    init = init
}
