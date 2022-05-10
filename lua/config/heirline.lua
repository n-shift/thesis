local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

conditions.hint = function()
    local msg = vim.lsp.util.get_progress_messages()[1]
    if msg ~= nil and not msg.done then return true else return false end
end

local left = ""
local right = ""
local Align = { provider = "%=" }
local Space = { provider = " " }

local colors = {
    red = utils.get_highlight("DiagnosticError").fg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("NonText").fg,
    orange = utils.get_highlight("DiagnosticWarn").fg,
    purple = utils.get_highlight("TSKeyword").fg,
    cyan = utils.get_highlight("Special").fg,
    diag = {
        warn = utils.get_highlight("DiagnosticWarn").fg,
        error = utils.get_highlight("DiagnosticError").fg,
        hint = utils.get_highlight("DiagnosticHint").fg,
        info = utils.get_highlight("DiagnosticInfo").fg,
    },
    git = {
        del = utils.get_highlight("diffDeleted").fg,
        add = utils.get_highlight("diffAdded").fg,
        change = utils.get_highlight("diffChanged").fg,
    },
}

local LspActive = {
    {
        provider = left,
        hl = { fg = colors.purple },
    },
    {
        hl = {
            bg = colors.purple,
        },
        provider = function()
            local names = {}
            for _, server in pairs(vim.lsp.buf_get_clients(0)) do
                table.insert(names, server.name)
            end
            return " [" .. table.concat(names, " ") .. "]"
        end
    },
    {
        provider = right,
        hl = { fg = colors.purple },
    }
}

local LspHints = {
    {
        condition = conditions.hint,
        provider = left,
        hl = { fg = colors.git.add }
    },
    {
        hl = {
            bg = colors.git.add,
        },
        provider = function()
            local message = vim.lsp.util.get_progress_messages()[1]
            if message ~= nil and not message.done then
                return string.format("%s %s%%", message.title, message.percentage)
            end
        end
    },
    {
        condition = conditions.hint,
        provider = right,
        hl = { fg = colors.git.add }
    },
}

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = "",
        warn_icon = "!",
        info_icon = "",
        hint_icon = "",
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    {
        provider = left,
        hl = { fg = colors.green },
    },
    {
        provider = function(self)
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.diag.error, bg = colors.green },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.diag.warn, bg = colors.green },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.diag.info, bg = colors.green },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.diag.hint, bg = colors.green },
    },
    {
        provider = right,
        hl = { fg = colors.green },
    },
}

local Lsp = {
    condition = conditions.lsp_attached,
    Diagnostics, Space, LspActive, Space, LspHints,
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { bg = colors.green, fg = colors.gray },
    {
        provider = left,
        hl = { fg = colors.green, bg = "NONE" },
    },
    {
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
    {
        provider = right,
        hl = { fg = colors.green, bg = "NONE" },
    }
}

local WorkDir = {
    {
        provider = left,
        hl = { fg = colors.blue }
    },
    {
        provider = function()
            local icon = " "
            local cwd = vim.fn.getcwd(0)
            cwd = vim.fn.fnamemodify(cwd, ":~")
            if not conditions.width_percent_below(#cwd, 0.25) then
                cwd = vim.fn.pathshorten(cwd)
            end
            local trail = cwd:sub(-1) == '/' and '' or "/"
            return icon .. cwd:gsub("\\", "/")  .. trail
        end,
        hl = { bg = colors.blue, fg = colors.gray, },
    },
    {
        provider = right,
        hl = { fg = colors.blue },
    }
}

local Filename = {
    {
        provider = left,
        hl = { fg = colors.blue },
    },
    {
        provider = function() return "." .. vim.api.nvim_buf_get_name(0):gsub(vim.fn.getcwd(), ""):gsub("\\", "/") end,
        hl = { bg = colors.blue, fg = colors.gray },
    },
    {
        provider = right,
        hl = { fg = colors.blue },
    },
}

local Ruler = {
    {
        provider = left,
        hl = { fg = colors.cyan },
    },
    {
        provider = "%7(%l/%3L%):%2c",
        hl = { bg = colors.cyan, fg = colors.gray },
    },
    {
        provider = right,
        hl = { fg = colors.cyan },
    },
}

require("heirline").setup({
    WorkDir, Space, Filename, Space, Git, Align, Lsp, Space, Ruler
})
