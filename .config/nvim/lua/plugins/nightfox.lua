-- import nvim-tree plugin safely
local setup, nightfox = pcall(require, "nightfox")
if not setup then
  return
end

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")

