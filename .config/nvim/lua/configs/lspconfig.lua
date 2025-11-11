require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "bashls",
  "helm_ls",
  "jsonls",
  "marksman",
  "pyright",
  "terraformls",
  "yamlls",
}

-- local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
