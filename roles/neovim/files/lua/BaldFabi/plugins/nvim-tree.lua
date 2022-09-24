local function init()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        open_on_setup = true,
        open_on_setup_file = true,
        open_on_tab = true,
        view = {
            adaptive_size = false
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
    })
end

return {
    init = init
}
