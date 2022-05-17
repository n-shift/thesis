--> Shift's neovim setup <--
if vim.g.neovim == "minimal" or vim.o.diff then
    require("thesis.disable.providers")
    vim.g.load_plugins = false
    require("thesis.minimal.core")
    require("thesis.minimal.manager")
else
    require("thesis.caching")
    require("thesis.disable")
    require("thesis.core")
    require("thesis.manager")
    require("thesis.lsp")
end
