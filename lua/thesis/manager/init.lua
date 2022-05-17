vim.api.nvim_create_augroup("Manager", {})
local function au(event, module)
    vim.api.nvim_create_autocmd(event, {
        group = "Manager",
        callback = function() require("thesis.manager."..module) end,
    })
end

require("thesis.manager.null")
au("BufEnter", "bufenter")
au("DirChanged", "dirchanged") vim.cmd("cd .")
