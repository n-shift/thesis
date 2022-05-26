local ManagerUtils = {}

local group_id

local function au(event, category, module)
    event = vim.split(event, ":")
    vim.api.nvim_create_autocmd(event[1], {
        pattern = event[2],
        group = group_id,
        callback = function() require("thesis.modules."..category.."."..module) end,
    })
end

function ManagerUtils.manage(category, config)
    for mod, event in pairs(config) do
        local module = mod:gsub("!", "")
        if mod == module then
            vim.cmd("packadd "..module)
        end
        if event == "NONE" then
            require("thesis.modules."..category.."."..module)
        else
            au(event, category, module)
        end
    end
end

function ManagerUtils.setup(id)
    group_id = id
end

return ManagerUtils
