local function copy()
	if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
		require('osc52').copy_register('+')
	end
end

vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- autocmd FileType php,phtml,html set tabstop=4
-- vim.api.nvim_command [[
-- 	autocmd FileType json,js,jsx,javascript,ts,tsx,typescript,typescriptreact,css,less,scss,norg set tabstop=2
-- ]]

-- fix for auto indent in php files
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd "set autoindent"
-- 		-- vim.cmd "set smartindent"
-- 	end
-- })

-- indent on specific filetypes
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd [[setlocal tabstop=2 shiftwidth=2]]
	end,
	pattern = { "*.json", "*.js", "*.jsx", "*.ts", "*.tsx", "*.yml", "*.yaml" },
})

-- indent on specific filetypes
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd [[setlocal tabstop=4 shiftwidth=4]]
		-- fix for auto indent in php files
		vim.cmd "set autoindent"
	end,
	pattern = { "*.php", "*.phtml", "*.html", "*.less", "*.css", "*.scss", "*.md" },
})

