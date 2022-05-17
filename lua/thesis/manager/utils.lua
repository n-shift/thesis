local ManagerUtils = {}

local function au(event, category, module)
    vim.api.nvim_create_autocmd(event, {
        group = "Manager",
        callback = function() require("thesis.modules."..category.."."..module) end,
    })
end

function ManagerUtils.manage(category, config)
    for module, event in pairs(config) do
        if event == "NONE" then
            require("thesis.modules."..category.."."..module)
        else
            au(event, category, module)
        end
    end
end

return ManagerUtils
