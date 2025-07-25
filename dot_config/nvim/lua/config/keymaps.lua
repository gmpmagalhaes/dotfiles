local map = vim.keymap.set
map("n", "<leader>v", '"*v', { silent = true, desc = "Paste from mouse" })
map("n", "<leader>V", '"*V', { silent = true, desc = "Paste before from mouse" })