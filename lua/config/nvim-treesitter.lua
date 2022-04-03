local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {
        "lua",
        "rust",
        "toml",
        "json",
        "norg",
        "latex",
        "query",
        "comment",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
})
