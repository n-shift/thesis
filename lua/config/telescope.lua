local telescope = require("telescope")
local config = {}
config.defaults = {
    vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--column",
        "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    file_ignore_patterns = { "node_modules", "target", ".git" },
}

telescope.setup(config)
