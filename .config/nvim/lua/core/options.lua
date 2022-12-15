--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth=4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

-- wrapping
vim.opt.wrap = false

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.iskeyword:append("-")

-- file formats
vim.opt.fileformat = unix

-- mouse
vim.opt.mouse = a

-- appearance
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

