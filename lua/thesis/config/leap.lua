require("leap").setup({
    case_insensitive = true,
})

vim.api.nvim_create_augroup("Conceal", {})
vim.api.nvim_create_autocmd("User", {
    pattern = "LeapEnter",
    group = "Conceal",
    callback = function()
        vim.opt.conceallevel = 0
    end,
})
vim.api.nvim_create_autocmd("User", {
    pattern = "LeapLeave",
    group = "Conceal",
    callback = function()
        vim.opt.conceallevel = 2
    end,
})
