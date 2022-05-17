local mappy = require("mappy")

mappy:setup({
    version = "nightly",
})

mappy
:new()
:set_maps({
    ["<leader>"] = {
        ["<leader>"] = ":w<cr>",
        ["s"] = ":so%<cr>",
        ["f"] = vim.lsp.buf.formatting,
    },
})
:map()

mappy:new():set_maps({ [";"] = ":" }):map()
mappy:new():set_maps({
    ["<f1>"] = ":SidebarNvimToggle<cr>",
    ["<f2>"] = ":SidebarNvimFocus<cr>",
}):map()

local function leap(config)
    return function()
        require("leap").leap(config)
    end
end

mappy
:new()
:set_maps({
    ["s"] = leap({}),
    ["S"] = leap({["reverse?"] = true}),
    ["gs"] = leap({["omni?"] = true, ["cross-window?"] = true}),
}):map()
