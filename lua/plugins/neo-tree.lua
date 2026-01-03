return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  cmd = "Neotree",
  keys = {
    { "<leader>e",  "<cmd>Neotree toggle<CR>",            desc = "Toggle File Explorer" },
    { "<leader>eg", "<cmd>Neotree git_status toggle<CR>", desc = "Git Status Explorer" },
    { "<leader>eb", "<cmd>Neotree buffers toggle<CR>",    desc = "Buffers Explorer" },
  },
  config = function()
    require("neo-tree").setup({

      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      default_component_configs = {
        container = { enable_character_fade = true },
        indent = { padding = 1, with_markers = true },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "ﰊ",
        },
      },

      window = {
        width = 30,
        position = "left",
        mapping_options = { noremap = true, nowait = true },
        mappings = {
          ["<CR>"] = "open",
          ["o"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["a"] = "add",
          ["r"] = "rename",
          ["d"] = "delete",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["f"] = "filter_on_submit",
          ["R"] = "refresh",
          ["?"] = "show_help",
        },
      },

      filesystem = {
        bind_to_cwd = false, -- IMPORTANT for monorepos
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },

        follow_current_file = {
          enabled = true, -- ✅ CORRECT KEY
          leave_dirs_open = true,
        },

        use_libuv_file_watcher = true, -- instant refresh
      },
    })

    keys = {
      { "<leader>ee", "<cmd>Neotree toggle<CR>",            desc = "Toggle Explorer" },
      { "<leader>eg", "<cmd>Neotree git_status toggle<CR>", desc = "Git Status" },
      { "<leader>eb", "<cmd>Neotree buffers toggle<CR>",    desc = "Buffers" },
    }
  end,
}
