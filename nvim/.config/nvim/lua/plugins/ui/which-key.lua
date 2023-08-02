return {
	-- noicer ui
	"folke/which-key.nvim",
	opts = function(_, opts)
		if require("alexiraola.util").has("noice.nvim") then
			opts.defaults["<leader>sn"] = { name = "+noice" }
		end
	end,
}
