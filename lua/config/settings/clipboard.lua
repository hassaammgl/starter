-- ===========================
-- CLIPBOARD / HISTORY SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Use system clipboard and improve command history

local o = vim.o  -- global options

-- CLIPBOARD
o.clipboard = "unnamedplus"  -- Use the system clipboard for all yank, delete, paste operations
-- TEST:
-- 1. In Neovim, yank a word: yw
-- 2. Paste in another application: Ctrl+V → should paste yanked text
-- 3. Copy text from another app and paste in Neovim: "+p

-- COMMAND / SEARCH HISTORY
o.history = 1000             -- store last 1000 commands and searches
-- TEST:
-- 1. Type some commands in command mode (:w, :q, etc.)
-- 2. Use :history to view
-- 3. Press : and Up/Down to navigate previous commands

-- OPTIONAL EXTRAS
o.backspace = "indent,eol,start"  -- make backspace behave naturally in insert mode
o.wildmenu = true                 -- enhanced command completion
o.wildmode = "longest:full,full" -- better completion for commands and files
o.incsearch = true               -- incremental search feedback
o.hlsearch = true                -- highlight search results


-- EXPLANATION

-- clipboard = "unnamedplus" → Makes y, d, p interact with system clipboard automatically.
-- history = 1000 → Saves long command and search history for easy navigation.
-- backspace → Makes backspace work intuitively in insert mode.
-- wildmenu / wildmode → Enhances tab completion for commands, files, and paths.