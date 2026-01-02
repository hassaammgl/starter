vim.g.mapleader = " "

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      local builtin = require("telescope.builtin")
      local Terminal  = require('toggleterm.terminal').Terminal

      -- Floating Lazygit
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      function _LAZYGIT_TOGGLE() lazygit:toggle() end

      -- Optional: <C-\> toggle for general floating terminal
      vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

      wk.register({
        -- Core groups
        ["<leader>f"] = { name = "Files" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>c"] = { name = "Code / LSP" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Toggles" },
        ["<leader>u"] = { name = "UI / Buffers" },

        -- Telescope / Search
        ["<leader>ff"] = { builtin.find_files, "Find Files" },
        ["<leader>fg"] = { builtin.live_grep, "Grep" },
        ["<leader>fb"] = { builtin.buffers, "Buffers" },
        ["<leader>fh"] = { builtin.help_tags, "Help Tags" },
        ["<leader>sw"] = { function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end, "Search Word" },

        -- Git
        ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        ["<leader>gs"] = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        ["<leader>gu"] = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
        ["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        ["<leader>gb"] = { "<cmd>Gitsigns blame_line<CR>", "Blame Line" },

        -- UI / Buffer commands
        ["<leader>ub"] = { "<cmd>ls<CR>", "List Buffers" },
        ["<leader>un"] = { "<cmd>enew<CR>", "New Buffer" },
        ["<leader>ud"] = { "<cmd>bdelete<CR>", "Delete Buffer" },
        ["<leader>ut"] = { "<cmd>tabnew<CR>", "New Tab" },
        ["<leader>uw"] = { "<cmd>only<CR>", "Close Other Windows" },

        -- Code / LSP
        ["<leader>cr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
        ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        ["<leader>cd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics" },
        ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format File" },

        -- Toggles
        ["<leader>tt"] = { "<cmd>ToggleTerm<CR>", "Floating Terminal" },
        ["<leader>tn"] = { "<cmd>set nu!<CR>", "Toggle Line Numbers" },
        ["<leader>tr"] = { "<cmd>set relativenumber!<CR>", "Toggle Relative Numbers" },
        ["<leader>tw"] = { "<cmd>set wrap!<CR>", "Toggle Wrap" },
      })
    end,
  },
}
