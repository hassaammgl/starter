-- ===========================
-- FILE / BACKUP SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Control backup, swap, undo, and persistent file history

local o = vim.o      -- global options
local fn = vim.fn    -- for paths

-- BACKUP / SWAP FILES
o.backup = false           -- don't create backup files (~file~)
o.writebackup = false      -- don't create backup before overwriting
o.swapfile = false         -- no swap files (prevents .swp clutter)

-- TEST:
-- Open a file, edit, and close without saving → no backup created
-- :echo &backup
-- :echo &swapfile

-- UNDO / PERSISTENT HISTORY
o.undofile = true                           -- enable persistent undo
o.undodir = fn.stdpath("data").."/undo"     -- directory to store undo files

-- TEST:
-- Edit a file, save, exit, reopen → use u / Ctrl+r to undo/redo history persists
-- :echo &undofile
-- :echo &undodir

-- OPTIONAL EXTRA FILE OPTIONS
o.autoread = true       -- automatically reload file if changed outside Vim
o.hidden = true         -- allows switching buffers without saving current
o.writebackup = false   -- disable backup before writing (redundant but explicit)

-- EXPLANATION

-- backup / writebackup → disables temporary backup files.
-- swapfile → disables .swp files to avoid clutter.
-- undofile / undodir → persistent undo history, so you can undo even after closing Neovim.
-- autoread → auto-refresh files changed outside Vim.
-- hidden → switch buffers without forcing save.