return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }, -- required
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git/" },
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
            })

            -- Optional keymaps for common actions
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<Space><Space>", builtin.find_files, { desc = "Telescope Find Files" })
            vim.keymap.set("n", "<Space>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
            vim.keymap.set("n", "<Space>fb", builtin.buffers, { desc = "Telescope Buffers" })
            vim.keymap.set("n", "<Space>fh", builtin.help_tags, { desc = "Telescope Help" })
        end,
        lazy = true,
    }
}
