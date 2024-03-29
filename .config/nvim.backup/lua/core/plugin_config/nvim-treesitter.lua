require'nvim-treesitter.configs'.setup {
    -- A list of parse names, or "all"
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "ruby", "vim" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
