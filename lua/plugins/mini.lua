return {
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.animate").setup({
                scroll = { enable = true, timing = 150, subscroll = 3 },
                resize = { enable = true },
                open = { enable = true },
                close = { enable = true },
            })
        end,
        lazy = true,
    },
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.surround").setup()
        end,
        lazy = true,
    },
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.bufremove").setup()
        end,
        lazy = true,
    },
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.align").setup()
        end,
        lazy = true,
    },
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.starter").setup()
        end,
        lazy = true,
    },
    {
        "nvim-mini/mini.nvim",
        git = {
            timeout = 900
        },
        version = "*",
        config = function()
            -- Only load the modules you need
            require("mini.pairs").setup()
        end,
        lazy = true,
    },
}
