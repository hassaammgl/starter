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
      wk.register({
        ["<leader>f"] = {
          name = "Files",
          ff = { builtin.find_files, "Find Files" },
          fg = { builtin.live_grep, "Grep" },
          fb = { builtin.buffers, "Buffers" },
          fh = { builtin.help_tags, "Help Tags" },
        },
        ["<leader>g"] = {
          name = "Git",
          gc = { function() vim.defer_fn(function() builtin.git_commits() end, 100) end, "Git Commits" },
          gs = { function() vim.defer_fn(function() builtin.git_status() end, 100) end, "Git Status" },
        },
      })
    end
  },
}
