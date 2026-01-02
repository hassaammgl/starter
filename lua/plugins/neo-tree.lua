return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                default_component_configs = {
                    container = { enable_character_fade = true },
                    indent = { padding = 1, with_markers = true },
                },
                window = {
                    width = 35,
                    mapping_options = { noremap = true, nowait = true },
                },
            })

            -- Optional keymap to toggle Neo-tree
            vim.keymap.set("n", "<Space>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree Explorer" })
        end,
        lazy = true,
    }

}
