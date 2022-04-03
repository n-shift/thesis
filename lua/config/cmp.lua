local cmp = require("cmp")
local luasnip = require("luasnip")

local function has_words_before()
    local col = vim.fn.col(".") - 1
    return col ~= 0 and vim.fn.getline("."):sub(col, col):match("%s") == nil
end

local function tab(cb)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        cb()
    end
end

local function stab(cb)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        cb()
    end
end

local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, item)
            item.kind = icons[item.kind].." "..item.kind
            item.menu = ({
                path = "[path]",
                norg = "[norg]",
                buffer = "[buffer]",
                luasnip = "[snip]",
                nvim_lsp = "[lsp]",
            })[entry.source.name]

            return item
        end,
    },
    mapping = {
        ["<cr>"] = cmp.mapping.confirm(),
        ["<tab>"] = cmp.mapping(tab),
        ["<s-tab>"] = cmp.mapping(stab),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete())
    },
    sources = {
        { name = "path" },
        { name = "norg" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
    },
    experimental = { ghost_text = true },
})

