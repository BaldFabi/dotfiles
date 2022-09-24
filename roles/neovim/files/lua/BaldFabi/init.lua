local function init()
    require 'BaldFabi.packer'.init()
    require 'BaldFabi.cmds'.init()
    require 'BaldFabi.shortcuts'.init()

    require 'BaldFabi.plugins.nvim-tree'.init()
end

return {
    init = init
}
