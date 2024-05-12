return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-t>]],
			hide_numbers = true,
			shade_filetype = {},
			shade_terminal = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			presist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlight = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
