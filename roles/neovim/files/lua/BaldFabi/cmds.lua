local function init()
    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
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
    vim.opt.relativenumber = true
    vim.opt.title = true
    vim.opt.colorcolumn = '80'
    --vim.cmd('set number relativenumber')

    --    vim.api.nvim_command('autocmd VimResized * wincmd =')
    vim.api.nvim_command('autocmd BufWritePre *.js,*.tsx,*.ts,*.md,*.css,*.scss,*.sass,*.yaml,*.yml,*.json,*.html :Neoformat')

    vim.cmd [[packadd packer.nvim]]
    vim.cmd [[colorscheme tokyonight-moon]]
end

return {
    init = init
}
