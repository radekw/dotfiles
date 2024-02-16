-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- requirement for other plugins
  use('nvim-lua/plenary.nvim')

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- file explorer
  use('nvim-tree/nvim-web-devicons')
  use('nvim-tree/nvim-tree.lua')

  -- nightfox
  use("EdenEast/nightfox.nvim")

  -- gitsigns
  use("lewis6991/gitsigns.nvim")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- comment
  use("numToStr/Comment.nvim")

  -- notify
  use("rcarriga/nvim-notify")

  -- telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope-file-browser.nvim" }) -- file browser
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

