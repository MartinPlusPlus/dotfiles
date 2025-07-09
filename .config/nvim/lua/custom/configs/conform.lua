print("[conform.nvim] loaded")

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
    },
    format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if ft == "c" or ft == "cpp" then
            return { lsp_fallback = true }
        end
        return false
    end,
})

vim.api.nvim_create_user_command("ConformFormat", function()
    conform.format()
end, {})
