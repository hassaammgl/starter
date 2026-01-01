-- ===========================
-- FOLDING SETTINGS
-- ===========================
-- Author: hassaammgl
-- Purpose: Configure code folding using Treesitter

local o = vim.o  -- global options

-- FOLD METHOD
o.foldmethod = "expr"                         -- Use expression for folding (dynamic)
o.foldexpr = "nvim_treesitter#foldexpr()"    -- Use Treesitter to calculate folds

-- FOLD LEVEL / DEFAULT STATE
o.foldlevel = 99       -- open all folds by default
o.foldenable = true    -- enable folding

-- TEST COMMANDS:
-- 1. Open a file with functions or classes
-- 2. Use zc → close fold
-- 3. Use zo → open fold
-- 4. zR → open all folds
-- 5. zM → close all folds
-- 6. za → toggle fold under cursor
-- 7. zb / zt → scroll to bottom/top of fold
-- 8. zd → delete fold manually

-- OPTIONAL EXTRAS
-- o.foldcolumn = "1"  -- show fold column in the gutter
-- o.foldlevelstart = 99 -- alternative to foldlevel
-- o.foldnestmax = 3    -- max nested folds
