require "user.keymap_func"


--Remap space as leader key
amap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Better window navigation
-- nmap("<C-h>", "<C-w>h")
-- nmap("<C-j>", "<C-w>j")
-- nmap("<C-k>", "<C-w>k")
-- nmap("<C-l>", "<C-w>l")

nmap("<Up>", "<C-y>")
nmap("<Down>", "<C-e>")

nmap("<Leader>w", ":w<CR>")
nmap("<Leader>h", ":noh<CR>") -- C-l in nvim 0.7+

-- nmap("Y", "y$") -- default behaviour in nvim 0.7+

-- Opens line below or above the current line
-- imap("<S-CR>", "<C-O>O")
-- imap("<C-CR>", "<C-O>o")

-- Allow gf to open non-existent files
nmap("gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
vmap("v", "<", "<gv")
vmap("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vmap("y", "myy`hay")
vmap("Y", "myY`y")

-- When text is wrapped, move by terminal rows
nmap("k", "gk")
nmap("j", "gj")

-- Paste replace visual selection without copying it
vmap("p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
imap(";;", "<Esc>A;<Esc>")
imap(",,", "<Esc>A,<Esc>")

nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

nmap("<leader>d", '"_d')
vmap("<leader>d", '"_d')

-- Resize window
nmap("<leader><C-j>", ":resize +2<CR>")
nmap("<leader><C-k>", ":resize -2<CR>")
nmap("<leader><C-l>", ":vertical resize -2<CR>")
nmap("<leader><C-h>", ":vertical resize +2<CR>")


-- NvimTree
nmap("<Leader>e", ":NvimTreeToggle<CR>")
nmap("<Leader>R", ":NvimTreeRefresh<CR>")
nmap("<Leader>i", ":NvimTreeFindFile<CR>")

--- Telescope
nmap("<Leader>j", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>")

nmap("<Leader>fB", "<cmd>lua require('telescope.builtin').builtin()<cr>")

function search_current_buffer()
    require('telescope.builtin').current_buffer_fuzzy_find(
        {
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            }
        }
    )
end

function project_search()
  require("telescope.builtin").find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require("nvim_lsp.util").root_pattern ".git"(vim.fn.expand "%:p"),
  }
end

nmap("<leader>fc", "<cmd>lua search_current_buffer()<cr>")
-- nmap("<leader>fp", "<cmd>lua project_search()<cr>")


-- Temporary mapping
-- vmap("<leader>r", ":'<,'>w !lua<cr>")
xmap("<leader>r", ":w !lua<cr>")
nmap("<leader>r", ":w | !lua %<cr>")
