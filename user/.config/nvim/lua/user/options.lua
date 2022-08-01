local o = vim.opt

o.autoindent = true
o.cindent = true
o.wrap = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.showmode = true

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
o.swapfile = false
o.undofile = false

o.updatetime = 300

o.termguicolors = true

-- o.spell = true
o.title = true

o.list = true
o.listchars = 'tab:▸ ,trail:·'

o.confirm = true

o.iskeyword = o.iskeyword + "-"
o.formatoptions = o.formatoptions
    - "a"
    + "c"
    + "r"
    - "o"
    - "t"
    + "q"
    + "n"
    + "j"
    - "2"

