--> Shift's neovim setup <--
if vim.g.neovim == "minimal" or vim.o.diff then
    require("disable.providers")
    vim.g.load_plugins = false
    require("minimal.core")
    require("minimal.manager")
else
    require("default.caching")
    require("disable")
    require("default.core")
    require("default.manager")
    require("default.lsp")
end
