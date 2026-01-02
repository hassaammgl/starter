return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    git = {
      timeout = 1200,
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          file_ignore_patterns = { ".git/" },
          mappings = {
            i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
          },
        },
      }
      local builtin = require("telescope.builtin")

      -- Telescope keymaps
      local wk = require("which-key")
      wk.add({
        { "<leader>f",  group = "Files" },
        { "<leader>ff", builtin.find_files, desc = "Find Files" },
        { "<leader>fg", builtin.live_grep,  desc = "Grep" },
        { "<leader>fb", builtin.buffers,    desc = "Buffers" },
        { "<leader>fh", builtin.help_tags,  desc = "Help Tags" },
      })
    end
  },
}
