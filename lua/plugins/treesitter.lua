return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- ensures parsers are installed
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "python", "javascript", "typescript", "tsx", "lua", "html", "css",
                "json", "bash", "markdown", "yaml", "go", "rust", "vue"
            },
            highlight = { enable = true },
            indent = { enable = true },
            playground = { enable = true }, -- optional: Treesitter playground
            incremental_selection = { enable = true },
            textobjects = { enable = true },
        })
    end,
}
