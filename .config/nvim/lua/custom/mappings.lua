local M = {}

M.general = {
    n = {
        ["<leader>f"] = {
            function ()
	            require("conform").format({ async = true, lsp_fallback = true })
            end
        },
    },
}

return M
