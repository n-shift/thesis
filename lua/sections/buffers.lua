local bufs = vim.api.nvim_list_bufs()
local function shorten(str, width, idx)
    local out
    if string.find(str, "\\") then
        local chunks = vim.split(str, "\\")
        chunks[idx] = chunks[idx]:sub(1,1)
        out = table.concat(chunks, "\\")
    else
        local chunks = vim.split(str, "/")
        chunks[idx] = chunks[idx]:sub(1,1)
        out = table.concat(chunks, "//")
    end

    if #out > width then
        return shorten(out, width, idx+1)
    else
        return out
    end
end

local function parse_buffer(pid, width)
    local name = vim.api.nvim_buf_get_name(pid)
    if string.find(name, "SidebarNvim_") then
        return nil
    end
    local cwd = vim.fn.getcwd()
    local tilde = vim.fn.expand("~")
    local out = name:gsub(cwd, '.'):gsub(tilde, "~")
    if #out > width then
        return shorten(out, width, 1)
    else
        return out
    end
end
local function draw(ctx)
    local lines = {}
    for _, pid in ipairs(bufs) do
        local name = parse_buffer(pid, ctx.width - #tostring(pid) - 3)
        if name ~= nil and name ~= "" then
            table.insert(lines, string.format("%s %s", pid, name))
        end
    end

    return lines
end

local function update()
    bufs = vim.api.nvim_list_bufs()
end

local function edit(line, _)
    line = line + 1
    vim.cmd("wincmd p")
    vim.cmd("buffer "..bufs[line])
end

local buffers = {
    title = "Buffer list",
    icon = "",
    draw = draw,
    update = update,
    bindings = {
        ["e"] = edit,
    },
}

return buffers
