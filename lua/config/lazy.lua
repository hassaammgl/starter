print("BEFORE LAZY SETUP")


-- Lazy.nvim bootstrap helper
local function ensure_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  -- check if already exists
  if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim... (this may take a while on slow networks)")
    local git_cmd = {
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=main",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    }
    local output = vim.fn.system(git_cmd)
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("Failed to clone lazy.nvim:\n" .. output)
      return nil
    end
    print("lazy.nvim installed successfully!")
  end

  -- prepend to runtimepath
  vim.opt.rtp:prepend(lazypath)

  -- return module
  return require("lazy")
end

-- bootstrap lazy
local lazy = ensure_lazy()
if not lazy then
  return
end

lazy.setup({
  git = { timeout = 1200 },
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = true, version = false },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  change_detection = { enabled = false, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
print("AFTER LAZY SETUP")
print("LAZY CONFIG LOADED")
