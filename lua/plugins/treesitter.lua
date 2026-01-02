return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "bash",
                "python",
                "c",
                "cpp",
            },
        })
    end,
}
