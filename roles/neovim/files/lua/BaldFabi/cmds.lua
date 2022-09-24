local function init()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.guicursor = ""
    vim.opt.swapfile = false
    vim.cmd('set number relativenumber')

    vim.cmd('nnoremap <Space> <Nop>')
    vim.cmd('let mapleader="\\<Space>"')

    --    vim.api.nvim_command('autocmd VimResized * wincmd =')
    vim.api.nvim_command('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll')

    vim.cmd [[packadd packer.nvim]]
    vim.cmd [[colorscheme tokyonight-moon]]
end

return {
    init = init
}
