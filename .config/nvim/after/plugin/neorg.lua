-- Notes
vim.keymap.set("n", "<leader>nn", "<cmd>:Neorg index<cr>", { desc = "Neorg index" })
vim.keymap.set("n", "<leader>nww", "<cmd>:Neorg workspace default<cr>", { desc = "Neorg workspace default" })
vim.keymap.set("n", "<leader>nwn", "<cmd>:Neorg workspace notes<cr>", { desc = "Neorg workspace notes" })

vim.keymap.set("n", "<leader>nj", "<cmd>:Neorg journal<cr>", { desc = "Neorg journal" })

vim.keymap.set("n", "<leader>nmn", "<cmd>:Neorg mode norg<cr>", { desc = "Neorg mode norg" })
vim.keymap.set("n", "<leader>nmh", "<cmd>:Neorg mode traverse-heading<cr>", { desc = "Neorg mode traverse-heading" })

vim.keymap.set("n", "<leader>nf", "<cmd>Telescope find_files cwd=~/.my-notes/<cr>", { desc = "Find notes" })
vim.keymap.set("n", "<leader>ng", "<cmd>Telescope live_grep cwd=~/.my-notes/<cr>", { desc = "Grep note" })

vim.keymap.set("n", "<leader>nq", "<cmd>e ~/.my-notes/quick-note.norg<cr>", { desc = "Quick note" })

