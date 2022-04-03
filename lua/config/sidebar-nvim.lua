require("sidebar-nvim").setup({
    sections = {
        -- Custom (sections...)
        require("sections.hello"),
        require("sections.buffers"),
        -- Builtin
        "files", "symbols", "todos",
    },
    update_interval = 500,
    section_separator = string.rep("-", 35-4)
})

