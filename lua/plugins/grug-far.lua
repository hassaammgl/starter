return {
    "folke/grug-far.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim", -- required
        "nvim-lua/plenary.nvim",
    },
    cmd = "GrugFar", -- lazy load on command
    keys = {
        { "<leader>fr", "<cmd>GrugFar<CR>", desc = "Grug Far: Find Files" },
    },
    config = function()
        require("grug-far").setup({
            -- Optional configuration
            prompt = "🔍 Search > ", -- prompt text
            include_hidden = true, -- include dotfiles
            git_ignored = false, -- include gitignored files
            search_dirs = {}, -- restrict to these directories
            follow_symlinks = true,
            preview = true, -- show preview window
            mappings = {
                open = "<CR>",
                split = "<C-s>",
                vsplit = "<C-v>",
                tabnew = "<C-t>",
                close = "q",
            },
        })

        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = {
                name = "Files",
                r = { "<cmd>GrugFar<CR>", "Grug Far: Find Files" },
            },
        })
    end,
    lazy = true,
}
