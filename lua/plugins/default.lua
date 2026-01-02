return {
  -- Popup & UI
  { "nvim-lua/plenary.nvim" },   -- Utility functions
  { "nvim-lua/popup.nvim" },     -- Popup API

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

}
