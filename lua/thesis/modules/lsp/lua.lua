vim.cmd("packadd lua-dev")
require("thesis.modules.lsp.state").fire_up("sumneko_lua",
    require("lua-dev").setup({
        lspconfig = {
            cmd = {
                "lua-language-server", "-E",
                vim.fn.expand("~/.code/lua/lua-language-server/main.lua")
            }
        }
    })
)
