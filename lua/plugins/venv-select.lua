return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python'
  },
  event = 'VeryLazy', -- lazy load
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>', desc = "Select Python Virtual Env" },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = "Select Cached Venv" },
  },
  config = function()
    local venv = require('venv-selector')

    venv.setup {
      -- Auto refresh the list of venvs when a new one is created
      auto_refresh = true,

      -- If true, automatically activate the cached venv for a project
      auto_select_cached = true,

      -- When true, will update `python_path` for attached LSP servers
      update_lsp = true,

      -- Update dap-python adapter with selected venv
      update_dap = true,

      -- Optional: name of the environment variable to use for Python path
      python_path_variable = "VIRTUAL_ENV",

      -- Telescope integration: use telescope picker instead of default
      telescope = true,

      -- Optional: default path to search for venvs
      search_paths = {
        "~/.virtualenvs",
        "./.venv",
        "./venv"
      },

      -- Optional: pick the first found venv automatically if only one exists
      auto_pick_single = true,
    }

    -- Optional: automatically attach venv to LSP and DAP
    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function()
        venv.select_cached()
      end,
    })
  end,
}
