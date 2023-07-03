require("harpoon").setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 10,
		height = vim.api.nvim_win_get_height(0) - 10,
	}
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hn", mark.add_file, { desc = "Harpoon new item" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>hj", function () ui.nav_file(1) end, { desc = "Nav no: 1" })
vim.keymap.set("n", "<leader>hk", function () ui.nav_file(2) end, { desc = "Nav no: 2" })
vim.keymap.set("n", "<leader>hl", function () ui.nav_file(3) end, { desc = "Nav no: 3" })
vim.keymap.set("n", "<leader>h;", function () ui.nav_file(4) end, { desc = "Nav no: 4" })

vim.keymap.set("n", "<leader>hf", function () ui.nav_file(5) end, { desc = "Nav no: 5" })
vim.keymap.set("n", "<leader>hd", function () ui.nav_file(6) end, { desc = "Nav no: 6" })
vim.keymap.set("n", "<leader>hs", function () ui.nav_file(7) end, { desc = "Nav no: 7" })
vim.keymap.set("n", "<leader>ha", function () ui.nav_file(8) end, { desc = "Nav no: 8" })

-- vim.fn.expand('%')
