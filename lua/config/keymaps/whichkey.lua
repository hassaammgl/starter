return {
  mappings = {
    ["<leader>ff"] = { "<cmd>Snacks.picker.files()<CR>", desc = "Find Files" },
    ["<leader>fg"] = { "<cmd>Snacks.picker.grep()<CR>", desc = "Grep" },
    ["<leader>gg"] = { "<cmd>Snacks.lazygit()<CR>", desc = "Lazygit" },
    ["<leader>sw"] = { "<cmd>Snacks.picker.grep_word()<CR>", desc = "Word" },
  },
  groups = {
    ["<leader>f"] = "Files",
    ["<leader>g"] = "Git",
    ["<leader>c"] = "Code",
    ["<leader>s"] = "Search",
    ["<leader>t"] = "Toggles",
  },
}