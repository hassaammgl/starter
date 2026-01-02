return {
    {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    opts = {
      signs = {
        add          = {text = '+'},
        change       = {text = '~'},
        delete       = {text = '_'},
        topdelete    = {text = '‾'},
        changedelete = {text = '~'},
      },
    },
    lazy = true,
  },
}