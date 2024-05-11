return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function ()
        local ufo = require("ufo")
        vim.keymap.set("n","zR", ufo.openAllFolds, {})
        vim.keymap.set("n","zM", ufo.closeAllFolds, {})
        vim.keymap.set("n","zK",
            function ()
                local win_id = ufo.peekFoldedLinesUnderCursor()
                if not win_id then
                    vim.lsp.buf.hover()
                end
            end
            , {})
        ufo.setup({
            provider_selector = function (bufnr, filetype, buftype)
                return { "lsp" , "indent" }
            end
        })

    end
}
