require("sidebar-nvim").setup({
    sections = {
        -- Custom (sections...)
        require("thesis.sections.hello"),
        require("thesis.sections.buffers"),
        -- Builtin
        "files", "symbols", "todos",
    },
    update_interval = 500,
    section_separator = string.rep("-", 35-4)
})

