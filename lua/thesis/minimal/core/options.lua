--> Vim opts
---> general
vim.opt.clipboard = "unnamedplus"

---> time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500

---> splits
vim.opt.splitbelow = true
vim.opt.splitright = true

---> numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

---> indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.linebreak = true
vim.opt.breakindent = true

---> visual
vim.opt.inccommand = "split"
vim.opt.termguicolors = true

---> misc
vim.opt.wildignore = ".git,target"
vim.opt.lazyredraw = true

---> shell
vim.opt.shell = "nu"
vim.opt.shellcmdflag = "-c"

