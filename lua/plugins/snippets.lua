return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- keymaps
            vim.keymap.set({ "i", "s" }, "<C-k>", function() require("luasnip").expand_or_jump() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-j>", function() require("luasnip").jump(-1) end, { silent = true })
        end,
        lazy = true,
    }
}
