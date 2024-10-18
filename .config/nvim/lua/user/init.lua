-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
vim.opt.guicursor = ""

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Make line numbers relative
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable break indent
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"

-- vim.opt.isfname:append("@-@")

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- vim.opt.colorcolumn = "80"

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Move below line in oneline
-- vim.keymap.set("n", "J", "mzJ`z")

-- Half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search keyword in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "p", "Nzzzv")

vim.keymap.set("n", "<leader>tl", "<cmd>:TodoQuickFix<CR>", { desc = "Todo quick fix" })
vim.keymap.set("n", "<leader>tt", "<cmd>:TodoTrouble<CR>", { desc = "Todo trouble" })
vim.keymap.set("n", "<leader>tf", "<cmd>:TodoTelescope<CR>", { desc = "Todo find" })

-- run
vim.keymap.set("n", "<Space>rj", ':! just<CR>', { desc = "Run just" })
