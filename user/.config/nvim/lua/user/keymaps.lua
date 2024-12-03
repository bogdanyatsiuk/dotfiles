local key = require("user.helpers.keymap_funcs")

-- Remap space as leader key
key.amap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Scroll instead of moving cursor with arrows
-- key.nmap("<Up>", "<C-y>")
-- key.nmap("<Down>", "<C-e>")

key.imap("<M-,>", "<Esc><S-a>,<Esc>")
key.imap("<M-;>", "<Esc><S-a>;<Esc>")

key.nmap("<Leader>w", ":w<CR>")
key.nmap("<Leader>W", ":wq<CR>")
-- key.nmap("<Leader>c", ":", { silent=false })
key.nmap("<Leader>l", ":noh<CR>")
key.nmap("<Leader>q", ":q<CR>")

-- Reselect visual selection after indenting
key.vmap("<", "<gv")
key.vmap(">", ">gv")
key.vmap("J", ":m '>+1<CR>gv=gv")
key.vmap("K", ":m '<-2<CR>gv=gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
key.vmap("y", "myy`y")
key.vmap("Y", "myY`y")

-- When text is wrapped, move by terminal rows
key.nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key.nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Replay macro
key.nmap("<C-q>", "@@")

-- Scroll to center on search and scroll
key.nmap("<C-d>", "<C-d>zz")
key.nmap("<C-u>", "<C-u>zz")
key.nmap("n", "nzzzv")
key.nmap("N", "Nzzzv")
key.nmap("J", "mzJ`z")

key.nmap("<leader>d", '"_d')
key.vmap("<leader>d", '"_d')

-- Toggle listchars
key.nmap("<leader>tl1", '<cmd>set listchars=tab:▸\\ ,trail:·<cr>')
key.nmap("<leader>tl2", '<cmd>set listchars=tab:▸\\ ,trail:·,eol:↲<cr>')
key.nmap("<leader>tl3", '<cmd>set listchars=tab:▸\\ ,trail:·,eol:↲,nbsp:𛲖<cr>')
key.nmap("<leader>tl4", '<cmd>set listchars=tab:▸\\ ,trail:\\ ,eol:\\ ,nbsp:\\ <cr>')

key.nmap("<Esc>", '<cmd>lua require("user.helpers.utils").dismiss_notice_and_higlights()<cr>', { desc = "Dismiss Notice notifications and highlights" })
key.nmap("g<Right>", '<cmd>lua require("user.helpers.utils").open_github_url()<cr>', { desc = "Open github url under the cursor" })

----------------------------
-- -- Nvim-Tree
-- key.nmap("<Leader>e", ":NvimTreeToggle<CR>")
-- -- nmap("<Leader>R", ":NvimTreeRefresh<CR>")
-- key.nmap("<Leader>i", ":NvimTreeFindFile<CR>")

------------------------------
---- Oilopen_float
--key.nmap("-", "<cmd>lua require('oil').open_float()<CR>", { desc = "Oil: Open parent directory" })
--
------------------------------
---- Harpoon
--key.nmap("<Leader>ma", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon: add file" })
--key.nmap("<Leader>md", "<cmd>lua require('harpoon.mark').rm_file()<CR>", { desc = "Harpoon: remove file" })
--key.nmap("<Leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Harpoon: toggle quick menu" })
--key.nmap("<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Harpoon: navigate to file 1" })
--key.nmap("<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Harpoon: navigate to file 2" })
--key.nmap("<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Harpoon: navigate to file 3" })
--key.nmap("<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Harpoon: navigate to file 4" })
--
------------------------------
---- Telescope
--key.nmap("<Leader>j", "<cmd>lua require('user.helpers.telescope').search_files()<cr>")
--key.nmap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
--key.nmap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
--key.nmap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
--key.nmap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
--key.nmap("<Leader>fB", "<cmd>lua require('telescope.builtin').builtin()<cr>")
--key.nmap("<leader>fc", "<cmd>lua require('user.helpers.telescope').search_current_buffer()<cr>")
--key.nmap("<leader>fr", "<cmd>Telescope repo list<cr>")
----key.nmap("<leader>fM", "<cmd>Telescope bookmarks<cr>")
--key.nmap("<leader>fM", "<cmd>lua require('user.helpers.telescope').open_bookmarks()<cr>", { desc = 'Fuzzy search browser bookmarks', })
--key.nmap("<leader>fy", "<cmd>lua require('user.helpers.telescope').neoclip()<cr>")
--key.nmap("<leader>fm", "<cmd>lua require('user.helpers.telescope').macros()<cr>")
--
