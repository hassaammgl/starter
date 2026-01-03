return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        -- Jump to char / word / pattern
        { "s",  mode = { "n", "x", "o" }, function() require("flash").jump() end,         desc = "Flash Jump" },
        { "S",  mode = { "n", "x", "o" }, function() require("flash").treesitter() end,  desc = "Flash Treesitter" },
        { "r",  mode = "o",             function() require("flash").remote() end,       desc = "Remote Flash" },
        { "R",  mode = { "o", "x" },    function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
        { "<c-s>", mode = { "c" },      function() require("flash").toggle() end,       desc = "Toggle Flash in Cmdline" },
    },
    config = function()
        require("flash").setup({
            search = {
                incremental = true,
                multi_window = false,
            },
            highlight = {
                groups = { label = "FlashLabel", match = "FlashMatch" },
            },
        })

        -- Modern which-key registration
        local wk = require("which-key")
        wk.add({
            { "<leader>j", group = "Flash" },
            { "<leader>js", function() require("flash").jump() end,          desc = "Flash Jump" },
            { "<leader>jS", function() require("flash").treesitter() end,   desc = "Flash Treesitter" },
            { "<leader>jr", function() require("flash").remote() end,       desc = "Remote Flash" },
            { "<leader>jR", function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        })
    end,
    lazy = true,
}
