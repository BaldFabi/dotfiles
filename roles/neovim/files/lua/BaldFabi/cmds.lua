local function init()
    vim.opt.list = true
    --vim.opt.listchars:append "eol:↴"
    --vim.opt.listchars:append "space:⋅"
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.guicursor = ""
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

    vim.api.nvim_command('autocmd VimResized * wincmd =')
    vim.api.nvim_command('autocmd BufWritePre *.js,*.tsx,*.ts,*.md,*.css,*.scss,*.sass,*.yaml,*.yml,*.json,*.html :Neoformat')
    vim.api.nvim_command("autocmd BufWritePre *.go :lua require 'BaldFabi.plugins.lspconfig'.goimports(1000)")

    vim.cmd [[packadd packer.nvim]]
end

return {
    init = init
}
