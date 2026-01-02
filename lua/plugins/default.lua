return {
    -- Colorscheme
    { "folke/tokyonight.nvim",       lazy = false, priority = 1000 },

    -- Popup & UI
    { "nvim-lua/plenary.nvim" }, -- Utility functions
    { "nvim-lua/popup.nvim" },   -- Popup API

    -- File icons
    { "nvim-tree/nvim-web-devicons", lazy = false },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
    },


   -- Commenting
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },

    -- Fuzzy finder (Telescope)
    { "nvim-telescope/telescope.nvim", dependencies = { "plenary.nvim" }, lazy = true },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
 -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
}
