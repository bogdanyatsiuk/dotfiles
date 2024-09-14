local o = vim.opt
local g = vim.g

-- Diable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Shift options
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true

-- Search & highlight
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.showmatch = true

o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 4
o.sidescrolloff = 4

o.splitright = true
o.splitbelow = true

o.mouse = "a"

o.clipboard = "unnamedplus"

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
o.updatetime = 300

o.termguicolors = true

-- o.spell = true
o.title = true

o.list = true
o.listchars = 'tab:▸ ,trail:·'

o.confirm = true

o.virtualedit = "block"

o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- o.laststatus = 3 -- global status line


