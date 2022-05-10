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
config.pickers = {}

for picker, _func in pairs(require("telescope.builtin")) do
    config.pickers[picker] = {}
    config.pickers[picker].theme = "ivy"
end

telescope.setup(config)
