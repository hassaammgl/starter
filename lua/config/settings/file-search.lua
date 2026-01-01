-- ===========================
-- SEARCH SETTINGS
-- ===========================

local o = vim.o      -- global options
local bo = vim.bo    -- buffer-local options

-- Case handling
o.ignorecase = true       -- searches ignore case by default
o.smartcase = true        -- BUT if you use uppercase letters, search becomes case-sensitive

-- Highlighting and live search
o.hlsearch = true         -- highlight all search matches
o.incsearch = true        -- show search matches as you type (incremental search)
o.showmatch = true        -- briefly jump to matching bracket
o.matchtime = 2           -- time in deciseconds to show matching parens (0.1s per unit)

-- Search wrapping and navigation
o.wrapscan = true         -- searches wrap around end/start of file
o.scrolloff = 3          -- keep 3 lines visible above/below cursor during search
o.inccommand = "split"    -- live preview for :substitute (optional, shows results in split)

-- Search optimization
o.ignorecase = true       -- ignore case unless uppercase letters are used
o.gdefault = true         -- make :s (substitute) global by default


-- ignorecase → Makes searches case-insensitive by default.
-- smartcase → If your search contains uppercase letters, it overrides ignorecase.
-- hlsearch → Highlights all matches after pressing Enter.
-- incsearch → Shows matches while typing.
-- showmatch / matchtime → Jump to matching brackets or parentheses briefly.
-- wrapscan → Search continues from top after bottom (and vice versa).
-- inccommand → Preview substitution results live in a split (modern UX).
-- gdefault → Adds global flag to substitutions automatically (like :%s/foo/bar/g).