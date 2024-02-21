return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        dockerls = {},
        helm_ls = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        terraformls = {},
        yamlls = {},
      },
    },
  },
}
