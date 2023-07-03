-- vim.g.netrw_keepdir = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 30
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_localcopydircmd = "cp -r"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

require 'lir'.setup {
	show_hidden_files = true,
	ignore = {},
	devicons = {
		enable = false,
		highlight_dirname = false
	},
	hide_cursor = false,
	mappings = {
			['l'] = actions.edit,
			['<CR>'] = actions.edit,
			['<C-s>'] = actions.split,
			['<C-v>'] = actions.vsplit,
			['<C-t>'] = actions.tabedit,
			['-'] = actions.up,
			['h'] = actions.up,
			['q'] = actions.quit,
			['<Esc>'] = actions.quit,
			['d'] = actions.mkdir,
			['%'] = actions.newfile,
			['R'] = actions.rename,
			['@'] = actions.cd,
			['Y'] = actions.yank_path,
			['.'] = actions.toggle_show_hidden,
			['D'] = actions.delete,
			['J'] = function()
			mark_actions.toggle_mark()
			vim.cmd('normal! j')
		end,
			['C'] = clipboard_actions.copy,
			['X'] = clipboard_actions.cut,
			['P'] = clipboard_actions.paste,
			['B'] = require 'lir.bookmark.actions'.list,
			['ba'] = require 'lir.bookmark.actions'.add,
			['M'] = require 'lir.mmv.actions'.mmv,
	}
}

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { "lir" },
	callback = function()
		-- use visual mode
		vim.api.nvim_buf_set_keymap(
			0,
			"x",
			"J",
			':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
			{ noremap = true, silent = true }
		)

		-- echo cwd
		vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
	end
})

-- custom folder icon
require 'nvim-web-devicons'.set_icon({
	lir_folder_icon = {
		icon = "",
		color = "#7ebae4",
		name = "LirFolderNode"
	}
})


require 'lir.git_status'.setup({
	show_ignored = false
})

local b_actions = require 'lir.bookmark.actions'
require 'lir.bookmark'.setup {
	bookmark_path = '~/.lir_bookmark',
	mappings = {
			['l'] = b_actions.edit,
			['<C-s>'] = b_actions.split,
			['<C-v>'] = b_actions.vsplit,
			['<C-t>'] = b_actions.tabedit,
			['<C-e>'] = b_actions.open_lir,
			['B'] = b_actions.open_lir,
			['q'] = b_actions.open_lir,
	}
}

-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Explore" })
-- vim.keymap.set("n", "<C-n>", vim.cmd.Lexplore, { desc = "Explore" })
-- vim.keymap.set("n", "<C-n>", vim.cmd.Lexplore('%:p:h'), { desc = "Explore current" })
-- vim.api.nvim_set_keymap('n', '<C-n>', ':Lexplore %:p:h<CR>', { noremap = true })

vim.keymap.set("n", "<leader>e", [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]], { noremap = true, desc = "Explore" })
vim.api.nvim_set_keymap(
	'n',
	'-',
	[[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]],
	{ noremap = true }
)

require('xlir.persist_history').setup()
