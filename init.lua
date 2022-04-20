--> Shift's neovim setup <--
if vim.g.neovim == "minimal" or vim.o.diff then
    require("disable.providers")
    vim.g.load_plugins = false
    require("minimal.core")
    require("minimal.manager")
else
    require("caching")
    require("disable")
    require("core")
    require("manager")
    require("lsp")
end
