-- ===========================
-- TABS & INDENTATION
-- ===========================

local o = vim.o      -- global options
local bo = vim.bo    -- buffer-local options

-- Basic tab / indentation
o.expandtab = true        -- convert tabs to spaces
o.shiftwidth = 2          -- spaces used for auto-indent
o.tabstop = 2             -- number of spaces a tab counts for
o.softtabstop = 2         -- spaces used when pressing Tab in insert mode
o.smartindent = true      -- auto-indent new lines like current line
o.autoindent = true       -- copy indent from previous line

-- Advanced indentation
o.smarttab = true         -- <Tab> respects shiftwidth at line start
o.shiftround = true       -- round indentation to multiple of shiftwidth
o.breakindent = true      -- visually indent wrapped lines
o.showbreak = "↪ "        -- symbol to show at start of wrapped line
o.virtualedit = "block"   -- allow cursor to move anywhere in visual block

-- overrides for specific filetypes
-- python uses 4-space indents
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
    end,
})

-- Make Makefiles use real tabs
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.bo.expandtab = false
    end,
})

-- expandtab → Tabs become spaces (recommended for most languages).
-- shiftwidth → Indent size when using >> or auto-indent.
-- tabstop → How many spaces a tab character counts for (important when opening files).
-- softtabstop → How many spaces a Tab inserts in insert mode.
-- smartindent / autoindent → Automatically indent new lines.
-- smarttab → Makes <Tab> behave intelligently at line start.
-- shiftround → Indent always rounds to nearest multiple of shiftwidth.
-- breakindent / showbreak → Visual aid for wrapped lines.
-- virtualedit → Useful for block selection and column edits.