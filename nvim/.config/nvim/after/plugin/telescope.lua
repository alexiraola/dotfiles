local status, telescope = pcall(require, "telescope")
if (not status) then return end

require('telescope').setup {
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true
		}
	},
	pickers = {
		find_files = {
			hidden = true
		},
		buffers = {
			previewer = false,
			layout_config = {
				width = 80
			}
		}
	}
}

require('telescope').load_extension('fzy_native')

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
