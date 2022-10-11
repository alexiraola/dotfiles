--- Configuration for LSP, formatters, and linters.
local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')

-- Completion setup
local compe = require('compe')

vim.o.completeopt = "menuone,noselect"

compe.setup {
	enabled = true;
	autocomplete = true;
	throttle_time = 200;
	source_timeout = 150;
	source = {
		-- only read from lsp and lua as I find buffer, path and others noisy.
		nvim_lsp = true;
		nvim_lua = true;
	}
}

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function ()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn["compe#complete"]()
	end
end

-- Handler to attach LSP keymappings to buffers using LSP.
local on_attach = function(client, bufnr)
	-- helper methods for setting keymaps
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	
	vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

	--- Mappings
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gh', "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)
	buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)

	-- Scroll down in popups
	buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)

	-- Navigate and preview
	buf_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
	buf_set_keymap('n', 'gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", opts)
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gr', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

	-- View diagnostics
	buf_set_keymap('n', '<space>e', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
	buf_set_keymap('n', '[d', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
	buf_set_keymap('n', ']d', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)

	-- Autocomplete
	buf_set_keymap("i", "<C-Space>", 'compe#complete()', {noremap = true, silent = true, expr = true})
	buf_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
	buf_set_keymap("i", "<Esc>", "compe#close('<Esc>')", {noremap = true, silent = true, expr = true})
	buf_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
end
 
-- Typescript
nvim_lsp.tsserver.setup {
	on_attach = function(client, bufnr)
		-- Disable tsserver formatting as prettier/eslint does that.
		client.resolved_capabilities.document_formatting = false
		on_attach(client, bufnr)
	end
}
 
saga.init_lsp_saga {
  error_sign = '\u{F658}',
  warn_sign = '\u{F071}',
  hint_sign = '\u{F835}',
}

require('formatter')
