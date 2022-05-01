local utils = require("utils")
if vim.fn.isdirectory(".git") == 1 then
    utils.cfg("gitsigns")
end
