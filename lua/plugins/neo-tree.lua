return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local neo_tree = require("neo-tree")

      neo_tree.setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          container = { enable_character_fade = true },
          indent = { padding = 1, with_markers = true },
          icon = { folder_closed = "", folder_open = "", folder_empty = "ﰊ" },
        },
        window = {
          width = 35,
          position = "left",
          mapping_options = { noremap = true, nowait = true },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      })

      local wk = require("which-key")

      -- Full Neo-tree action mapping
      wk.register({
        ["<leader>e"] = {
          name = "File Explorer",
          -- Explorer toggle/focus
          o = { "<cmd>Neotree focus<CR>", "Focus File/Folder" },
          R = { "<cmd>Neotree refresh<CR>", "Refresh Tree" },
          ["?"] = { "<cmd>Neotree show_help<CR>", "Help / Keybindings" },

          -- Navigation
          l = { "<cmd>Neotree reveal<CR>", "Reveal / Expand" },
          h = { "<cmd>Neotree collapse<CR>", "Collapse Folder" },
          j = { "<cmd>Neotree next_sibling<CR>", "Next Sibling" },
          k = { "<cmd>Neotree prev_sibling<CR>", "Previous Sibling" },
          ["<"] = { "<cmd>Neotree prev_source<CR>", "Previous Source" },
          [">"] = { "<cmd>Neotree next_source<CR>", "Next Source" },

          -- File operations
          r = { "<cmd>Neotree rename<CR>", "Rename" },
          d = { "<cmd>Neotree delete<CR>", "Delete" },
          a = { "<cmd>Neotree add<CR>", "Add File/Folder" },
          y = { "<cmd>Neotree copy_path<CR>", "Copy Path" },
          x = { "<cmd>Neotree cut<CR>", "Cut File" },
          p = { "<cmd>Neotree paste<CR>", "Paste File" },

          -- Open files
          s = { "<cmd>Neotree open_split<CR>", "Open Split" },
          v = { "<cmd>Neotree open_vsplit<CR>", "Open Vertical Split" },
          t = { "<cmd>Neotree open_tabnew<CR>", "Open Tab" },

          -- Filter / Search
          f = { "<cmd>Neotree filter<CR>", "Filter/Search" },

          -- Git / diagnostics (if enabled)
          g = { "<cmd>Neotree git_status<CR>", "Git Status" },
          e = { "<cmd>Neotree diagnostics<CR>", "Diagnostics" },
        }
      })
    end,
    lazy = true,
  }
}
