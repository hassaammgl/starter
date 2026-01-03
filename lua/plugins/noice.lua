return {
    "folke/noice.nvim",
    git = {
        timeout = 1200, -- Timeout in seconds for git clones
    },
    enabled = false,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
       "rcarriga/nvim-notify", -- preferred notifier backend
    },
    config = function()
        require("noice").setup({
            -- see :h noice-config for details
            lsp = {
                -- enable LSP overrides
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true, -- better search UI
                command_palette = true, -- nicer : commands
                long_message_to_split = true, -- long messages go to split
            },
            routes = {
                {
                    filter = { event = "msg_show", kind = "", find = "written" },
                    opts = { skip = true },
                },
            },
            views = {
                cmdline_popup = { border = { style = "rounded", padding = { 1, 2 } } },
                popupmenu = { border = { style = "rounded" } },
            },
            notify = {
        enabled = true,
      },
        })

        -- Optional: better notifications via nvim-notify
        vim.notify = require("notify")

        -- Which‑key registration (noice helpers)
        local wk = require("which-key")
        wk.add({
            { "<leader>n",  group = "Noice" },
            { "<leader>nn", "<cmd>Noice last<CR>",    desc = "Last Noice Message" },
            { "<leader>nh", "<cmd>Noice hover<CR>",   desc = "Hover (LSP/Noice)" },
            { "<leader>nl", "<cmd>Noice history<CR>", desc = "Message History" },
            { "<leader>nc", "<cmd>Noice dismiss<CR>", desc = "Clear Messages" },
            { "<leader>nm", "<cmd>Noice modes<CR>",   desc = "Noice Menu Modes" },
            { "<leader>ns", "<cmd>Noice spaawn<CR>",  desc = "Noice Spaawn" },
        })
    end,
}

