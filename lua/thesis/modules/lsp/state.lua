local State = {
    sumneko_lua = false,
    texlab = false,
    rust_analyzer = false,
}

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

function State.fire_up(server, config, cb)
    if not State[server] then
        config = vim.tbl_deep_extend("force", {capabilities = capabilities, on_attach = attach}, config)
        require("lspconfig")[server].setup(config)
        State[server] = true
    end
end

return State
