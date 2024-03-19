local g = vim.g
g.mapleader = "\\"

local M = {}

M.plugins = "custom.plugins"

M.mappings = require "custom.configs.mappings"

return M
