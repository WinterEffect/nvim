return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                -- rust linter and formater
                null_ls.builtins.diagnostics.ltrs,
                null_ls.builtins.formatting.dxfmt
				},
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, {}),
		})
	end,
}
