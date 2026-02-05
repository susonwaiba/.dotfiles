-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
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
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

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
vim.keymap.set("n", "N", "Nzzzv")

-- run
vim.keymap.set("n", "<Space>rj", ":! just<CR>", { desc = "Run just" })

-- Helper function to get the path in both normal buffers and Oil buffers
local function get_path(mod)
  if vim.bo.filetype == "oil" then
    local entry = require("oil").get_cursor_entry()
    local dir = require("oil").get_current_dir()
    if not entry or not dir then return nil end
    local full_path = dir .. entry.name
    return vim.fn.fnamemodify(full_path, mod)
  end
  return vim.fn.expand("%" .. mod)
end

-- Copy Relative Path
vim.keymap.set("n", "<leader>yr", function()
  local path = get_path(":.")
  if path then
    vim.fn.setreg("+", path)
    vim.notify("Copied relative path: " .. path)
  end
end, { desc = "Copy relative file path" })

-- Copy Absolute Path
vim.keymap.set("n", "<leader>yp", function()
  local path = get_path(":p")
  if path then
    vim.fn.setreg("+", path)
    vim.notify("Copied absolute path: " .. path)
  end
end, { desc = "Copy absolute file path" })

-- Copy File Name
vim.keymap.set("n", "<leader>yn", function()
  local path = get_path(":t")
  if path then
    vim.fn.setreg("+", path)
    vim.notify("Copied file name: " .. path)
  end
end, { desc = "Copy file name" })

