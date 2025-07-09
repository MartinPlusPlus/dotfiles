return {
    {
        "stevearc/conform.nvim",
        lazy = false,
	    config = function()
	        require("custom.configs.conform")
	    end,
    },
}
