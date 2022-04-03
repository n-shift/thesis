vim.cmd("packadd lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local function attach(_, bufnr)
    local function nmap(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, {buffer = true})
    end
    nmap("K", vim.lsp.buf.hover)
    nmap("gd", vim.lsp.buf.definition)
    nmap("gD", vim.lsp.buf.declaration)
    nmap("[d", vim.diagnostic.goto_next)
    nmap("]d", vim.diagnostic.goto_prev)
    nmap("<leader>ca", vim.lsp.buf.code_action)
    nmap("<leader>Q", vim.diagnostic.setqflist)
end

local function configure(client, tbl)
    local config = vim.tbl_deep_extend("force", {capabilities = capabilities, on_attach = attach}, tbl)
    require("lspconfig")[client].setup(config)
    if vim.lsp.buf_get_clients(0) == {} then
        vim.cmd("edit%")
    end
end

-- Rust
configure("rust_analyzer", {})
-- Lua
vim.cmd("packadd lua-dev")
local setup = require("lua-dev").setup({
    lspconfig = {
        cmd = { "lua-language-server", "-E", vim.fn.expand("~/.code/lua/lua-language-server/main.lua")},
        capabilities = capabilities,
        on_attach = attach,
    }
})
configure("sumneko_lua", setup)
