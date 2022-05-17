require("thesis.manager.utils").manage("completion", {
    ["luasnip"] = "VimEnter",
    ["cmp"] = "VimEnter",
})

require("thesis.utils").enable("cmp_luasnip")
require("thesis.utils").enable("cmp_nvim_lsp")
require("thesis.utils").enable("cmp_buffer")
require("thesis.utils").enable("cmp_path")
