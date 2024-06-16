return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"tsserver",
					"cssls",
                    "cmake",
                    "autotools_ls",
                    "neocmake",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities, -- adding this to language server will add lsp completions
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
                filetypes = { "typescript" , "typescriptreact" , "typescript.tsx" , "javascript" },
				cmd = { "typescript-language-server" , "--stdio" }
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
            lspconfig.autotools_ls.setup({
				capabilities = capabilities,
			})
            lspconfig.cmake.setup({
				capabilities = capabilities,
			})
            lspconfig.neocmake.setup({
				capabilities = capabilities,
			})

			-- keybinds for lsp integretion when lsp is attached to buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>of", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
                    vim.keymap.set("n", "<space>fx", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
