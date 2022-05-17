local utils = {}

function utils.enable(plugin)
    vim.cmd("packadd "..plugin)
end

function utils.cfg(category, plugin)
    utils.enable(plugin)
    require("thesis.modules."..category.."."..plugin)
end

function utils.highlighter(group, colors, style)
    if colors.bg ~= nil then
        vim.cmd("highlight "..group.." guibg="..colors.bg)
    end
    if colors.fg ~= nil then
        vim.cmd("highlight "..group.." guifg="..colors.fg)
    end
    if style ~= nil then
        vim.cmd("highlight "..group.." gui="..style)
    end
end

return utils
