-- leader
vim.g.mapleader = "\\"

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- wrapping
vim.opt.wrap = false

-- completeopt
vim.opt.completeopt = { "noinsert", "noselect", "popup" }

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.iskeyword:append "-"

-- file formats
vim.opt.fileformat = "unix"

-- mouse
vim.opt.mouse = "a"

-- appearance
vim.opt.termguicolors = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- NvChad
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
