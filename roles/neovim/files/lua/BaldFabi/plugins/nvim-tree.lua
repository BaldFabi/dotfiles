local function init()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = false }

    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        --open_on_setup = true,
        --open_on_setup_file = true,
        --open_on_tab = true,
        view = {
            adaptive_size = false,
            mappings = {
                list = {
                    { key = "+", action = "vsplit" },
                    { key = "-", action = "split" },
                }
            }
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
        }
    })

    map('n', '<leader>b', '<CMD>NvimTreeToggle<CR>', options)
end

return {
    init = init
}
