
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed={
                "bash",
                "dockerfile",
                "gitignore",
                "json",
                "lua",
                "markdown",
                "python",
                "sql",
                "yaml"
            },
            highlight={true},
            indent={enable=true},
        })
    end
}
