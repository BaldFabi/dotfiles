local function init()
    require 'BaldFabi.packer'.init()
    require 'BaldFabi.cmds'.init()
    require 'BaldFabi.shortcuts'.init()
end

return {
    init = init
}
