local function init()
    vim.opt.list = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.guicursor = "v-i-r:ver25"
    vim.opt.swapfile = false
    vim.opt.scrolloff = 10
    vim.opt.wrap = false
    vim.opt.autoindent = true
    vim.opt.smartindent = true
    vim.scriptencoding = 'utf-8'
    vim.opt.encoding = 'utf-8'
    vim.opt.title = true
    vim.opt.colorcolumn = '80'
    vim.opt.termguicolors = true
    vim.opt.wildmenu = true
    vim.opt.cursorline = true
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.mouse = ""

    vim.api.nvim_command('autocmd VimResized * wincmd =')
    vim.api.nvim_command('autocmd BufWritePre *.go,*.tf,*.js,*.tsx,*.ts,*.md,*.css,*.scss,*.sass,*.yaml,*.yml,*.json,*.html :Neoformat')

    vim.cmd [[packadd packer.nvim]]
end

return {
    init = init
}
