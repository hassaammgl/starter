-- ===========================
-- SCROLLING / CURSOR SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Configure smooth scrolling, cursor behavior, wrapping, and mouse support

local o = vim.o      -- global options
local wo = vim.wo    -- window-local options

-- CURSOR SCROLLING / PADDING
o.scrolloff = 8        -- keep 8 lines visible above/below cursor
o.sidescrolloff = 8    -- horizontal padding for cursor (useful in long lines)

-- TEST:
-- Open a long file and move cursor with j/k or arrow keys
-- Cursor will always have 8 lines of context above/below

-- CURSOR HIGHLIGHT
wo.cursorcolumn = false -- disable highlighting of current column
-- Alternative: set to true if you want a vertical cursor guide
-- TEST: :set cursorcolumn? → check status

-- MOUSE SUPPORT
o.mouse = "a"          -- enable mouse in all modes (normal, insert, visual, command)
-- TEST: Try scrolling with mouse wheel, resizing splits, selecting text

-- LINE WRAPPING
o.wrap = false          -- disable line wrapping (long lines stay horizontal)
o.linebreak = true      -- if wrap is enabled, wrap at word boundaries instead of breaking mid-word
-- TEST: :set wrap? → false disables wrap
-- TEST: :set linebreak? → only matters if wrap is true

-- VIRTUAL EDIT / BLOCK MODE
o.virtualedit = "block" -- allow cursor to move freely in visual block mode (including past line ends)
-- TEST: Ctrl+v (visual block) → move cursor past line ends

-- OPTIONAL: Smooth scrolling with relative movements
-- vim.opt.scrolljump = 5       -- lines to jump with ctrl-d / ctrl-u
-- vim.opt.scrolloff = 8        -- lines to keep around cursor

-- Key Notes

-- scrolloff / sidescrolloff → keeps context around cursor; great for coding in long files.
-- cursorcolumn → can be enabled to highlight current column (like VSCode guides).
-- mouse → essential for split resizing or selecting text with mouse.
-- wrap / linebreak → controls horizontal and soft wrapping behavior.
-- virtualedit → essential for block editing or multi-column selection.