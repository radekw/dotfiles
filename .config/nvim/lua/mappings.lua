require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map('i', '<C-j>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

map('n', '<leader>zc', "<cmd> CopilotChat <cr>", { desc = "Copilot Chat" })
map('v', '<leader>ze', "<cmd> CopilotChatExplain <cr>", { desc = "Copilot Chat Explain" })
map('n', '<leader>zm', "<cmd> CopilotChatModels <cr>", { desc = "Copilot Chat Models" })

