-- ===========================
-- PERFORMANCE / UX SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Improve Neovim responsiveness, completion behavior, and UX

local o = vim.o  -- global options

-- MAPPED SEQUENCE TIMEOUT
o.timeoutlen = 300  -- time in ms to wait for a mapped sequence
-- TEST:
-- Map a key combo, e.g., :nnoremap <leader>f :echo "Test"<CR>
-- Press <leader> slowly → should trigger after 300ms

-- CURSORHOLD / UPDATE TIME
o.updatetime = 300  -- faster CursorHold events (like LSP, diagnostics, etc.)
-- TEST:
-- Open a file and hover over symbols using LSP → hover shows faster
-- Check CursorHold events: :echo v:updatetime

-- REDRAW / MACROS
o.redrawtime = 1500    -- max ms to redraw screen (prevents freezes on huge files)
o.lazyredraw = true    -- don't redraw while executing macros / scripts
-- TEST:
-- Record a macro on large file → faster execution
-- :set lazyredraw? → true

-- COMPLETION OPTIONS (for nvim-cmp or built-in)
o.completeopt = "menuone,noselect"  -- show menu, don't auto-select first item
-- TEST:
-- Trigger completion: :lua vim.lsp.buf.completion() or insert text in a file with LSP
-- Should show menu without auto-selecting first item

-- OPTIONAL EXTRAS
-- o.updatetime = 100  -- even faster CursorHold, but may increase CPU
-- o.ttimeoutlen = 10  -- timeout for key codes (arrow keys, etc.)


-- EXPLANATION

-- timeoutlen → Controls how long Neovim waits for multi-key mappings.
-- updatetime → Reduces lag for LSP hover, diagnostics, and CursorHold events.
-- redrawtime / lazyredraw → Improves performance when executing macros or opening large files.
-- completeopt → Recommended for nvim-cmp for a smooth completion experience.