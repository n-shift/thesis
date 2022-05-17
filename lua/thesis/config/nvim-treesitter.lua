local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {
        "lua",
        "vim",
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
