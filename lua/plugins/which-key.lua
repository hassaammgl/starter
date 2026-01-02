vim.g.mapleader = " "

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup()

      local builtin  = require("telescope.builtin")
      local Terminal = require("toggleterm.terminal").Terminal

      -- Floating Lazygit
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })

      local function lazygit_toggle()
        lazygit:toggle()
      end

      -- Floating terminal
      vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { silent = true })

      wk.add({

        -- FILES
        { "<leader>f", group = "Files" },
        { "<leader>ff", builtin.find_files, desc = "Find Files" },
        { "<leader>fg", builtin.live_grep, desc = "Grep" },
        { "<leader>fb", builtin.buffers, desc = "Buffers" },
        { "<leader>fh", builtin.help_tags, desc = "Help Tags" },

        -- SEARCH
        { "<leader>s", group = "Search" },
        {
          "<leader>sw",
          function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
          end,
          desc = "Search Word",
        },

        -- GIT
        { "<leader>g", group = "Git" },
        { "<leader>gg", lazygit_toggle, desc = "Lazygit" },
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
        { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line" },

        -- CODE / LSP
        { "<leader>c", group = "Code / LSP" },
        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename Symbol" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
        { "<leader>cd", vim.diagnostic.open_float, desc = "Diagnostics" },
        {
          "<leader>cf",
          function() vim.lsp.buf.format({ async = true }) end,
          desc = "Format File",
        },

        -- UI / BUFFERS
        { "<leader>u", group = "UI / Buffers" },
        { "<leader>ub", "<cmd>ls<CR>", desc = "List Buffers" },
        { "<leader>un", "<cmd>enew<CR>", desc = "New Buffer" },
        { "<leader>ud", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
        { "<leader>ut", "<cmd>tabnew<CR>", desc = "New Tab" },
        { "<leader>uw", "<cmd>only<CR>", desc = "Close Other Windows" },

        -- TOGGLES
        { "<leader>t", group = "Toggles" },
        { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Floating Terminal" },
        { "<leader>tn", "<cmd>set nu!<CR>", desc = "Line Numbers" },
        { "<leader>tr", "<cmd>set relativenumber!<CR>", desc = "Relative Numbers" },
        { "<leader>tw", "<cmd>set wrap!<CR>", desc = "Wrap" },
      })
    end,
  },
}
