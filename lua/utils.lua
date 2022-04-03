local utils = {}

function utils.enable(plugin)
    vim.cmd("packadd "..plugin)
end

function utils.cfg(plugin)
    utils.enable(plugin)
    require("config."..plugin)
end

return utils
