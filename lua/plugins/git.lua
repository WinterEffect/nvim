return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>lb", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
    {
        "tpope/vim-fugitive",
        config = function ()
            vim.keymap.set("n","<leader>gl", ":Git log<CR>")
            vim.keymap.set("n","<leader>gs", ":Git status<CR>")
        end
    }
}
