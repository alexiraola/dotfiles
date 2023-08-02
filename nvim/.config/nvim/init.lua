require("alexiraola.automcmds")
require("alexiraola.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("alexiraola.keymaps")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.coding" },
		{ import = "plugins.editor" },
		{ import = "plugins.ui" },
		{ import = "plugins.lang.json" },
		{ import = "plugins.lang.typescript" },
	},
})
require("lazy.core.util").try(function()
	vim.cmd.colorscheme("catppuccin")
end, {
	msg = "Could not load your colorscheme",
	on_error = function(msg)
		require("lazy.core.util").error(msg)
		vim.cmd.colorscheme("habamax")
	end,
})
