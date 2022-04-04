require("sidebar-nvim").setup({
    sections = {
        -- Custom (sections...)
        require("default.sections.hello"),
        require("default.sections.buffers"),
        -- Builtin
        "files", "symbols", "todos",
    },
    update_interval = 500,
    section_separator = string.rep("-", 35-4)
})

