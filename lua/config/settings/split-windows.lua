-- ===========================
-- SPLIT WINDOWS SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Configure how new splits behave and window appearance

local o = vim.o      -- global options
local wo = vim.wo    -- window-local options

-- DEFAULT SPLIT DIRECTIONS
o.splitright = true    -- vertical splits open to the right
o.splitbelow = true    -- horizontal splits open below

-- TEST:
-- :vsplit <file>  → opens file in a right-hand split
-- :split <file>   → opens file in a bottom split

-- RESIZE BEHAVIOR
o.equalalways = true   -- all splits resize equally
o.splitkeep = "screen" -- keep text position when splitting

-- TEST:
-- Open multiple splits and resize window: all splits stay equal
-- :vsplit file2 | :split file3

-- WINDOW APPEARANCE
wo.signcolumn = "yes"      -- always show sign column (for git/LSP)
wo.number = true            -- show line numbers
wo.relativenumber = true    -- show relative numbers

-- TEST:
-- Open splits and check line numbers
-- :vsplit file2
-- :set number?
-- :set relativenumber?

-- FLOATING WINDOWS / POPUPS
o.winblend = 10        -- floating window transparency
o.pumblend = 10        -- completion menu transparency

-- TEST:
-- :Telescope find_files  → see popup transparency
-- :lua vim.lsp.buf.hover() → floating hover window transparency

-- BUFFER SWITCHING BEHAVIOR
o.switchbuf = "useopen,uselast" -- opens existing buffer in split if available

-- TEST:
-- Open same file in another split, see it uses existing window


-- Benefits of this approach

-- Each file contains only related options.
-- Self-documenting: Each option has a comment explaining its purpose.
-- Test commands included, so you can try each behavior without Googling.
-- Works perfectly with nested imports: just require("config.settings") in init.lua