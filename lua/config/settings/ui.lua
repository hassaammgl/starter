local o = vim.o
local wo = vim.wo

-- Colors & Theme
o.termguicolors = true       -- enable true colors (24-bit)
o.background = "dark"        -- dark mode for colorschemes

-- Line Numbers
wo.number = true             -- show absolute line numbers
wo.relativenumber = true     -- show relative numbers
wo.cursorline = true         -- highlight current line
wo.cursorcolumn = false      -- highlight current column (optional)

-- Signs / Status
o.signcolumn = "yes"         -- always show signs (LSP / git / diagnostics)
o.showmode = false           -- hide --INSERT-- (statusline will show mode)
o.showcmd = true             -- show partial commands
o.ruler = true               -- show cursor position in statusline
o.cmdheight = 1              -- command line height

-- Visual Guides
o.colorcolumn = "80"         -- vertical guide at 80 chars
o.list = true                -- show invisible characters
o.listchars = "tab:>-,trail:·,extends:>,precedes:<,nbsp:␣" -- symbols for invisible chars

-- Popup / Floating Windows
o.pumheight = 15             -- max height for popup menu
o.pumblend = 10              -- popup menu transparency
o.winblend = 10              -- floating window transparency

-- Folding (visual appearance)
o.foldmethod = "expr"                    -- folding method
o.foldexpr = "nvim_treesitter#foldexpr()"-- treesitter folding
o.foldenable = true
o.foldlevel = 99                         -- all folds open by default

-- Window / Separator Appearance
o.fillchars = "vert:│,fold: ,eob: "     -- vertical lines, folds, empty lines

-- Cursor Shape
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" 
-- normal:block, insert:vertical, replace:horizontal
