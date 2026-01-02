vim.g.mapleader = " "  -- set leader key to space

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.register({
        -- Groups
        ["<leader>f"] = { name = "Files" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>c"] = { name = "Code" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Toggles" },

        -- Commands
        ["<leader>ff"] = { "<cmd>Snacks.picker.files()<CR>", desc = "Find Files" },
        ["<leader>fg"] = { "<cmd>Snacks.picker.grep()<CR>", desc = "Grep" },
        ["<leader>gg"] = { "<cmd>Snacks.lazygit()<CR>", desc = "Lazygit" },
        ["<leader>sw"] = { "<cmd>Snacks.picker.grep_word()<CR>", desc = "Word" },
      })
    end,
  },
}
