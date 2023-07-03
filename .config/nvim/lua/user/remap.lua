vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save current buffer
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR><Esc>")
vim.keymap.set("n", "<C-s>", ":w<CR><Esc>")

-- move selected section
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")

-- vim.keymap.set("n", "Y", "yg$")

-- Move below line in oneline
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search keyword in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy paste
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste fix" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank fix" })
vim.keymap.set("n", "<leader>yy", "\"+yy", { desc = "Yank Yank fix" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank fix" })

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", "<cmd>:w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>c", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<leader>Tl", "<cmd>:TodoQuickFix<CR>", { desc = "Todo quick fix" })
vim.keymap.set("n", "<leader>Tt", "<cmd>:TodoTrouble<CR>", { desc = "Todo trouble" })
vim.keymap.set("n", "<leader>Tf", "<cmd>:TodoTelescope<CR>", { desc = "Todo find" })

-- run
vim.keymap.set("n", "<Space>rb", ':! cd md_to_json && cargo run<CR>', { desc = "Run build" })
vim.keymap.set("n", "<Space>rj", ':! just<CR>', { desc = "Run just" })

-- vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
vim.api.nvim_set_keymap("i", "<M-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("i", "<M-p>", "<cmd>Copilot panel<cr>", { desc = "Open Copilot panel" })
