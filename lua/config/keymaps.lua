-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd
local g = vim.g -- global variables
local fn = vim.fn

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------
map('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
map('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
map('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
map('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
map('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
-- map('n', '<Tab>', ':tabnext<CR>', {noremap = true})
-- map('n', '<S-Tab>', ':tabprevious<CR>', {noremap = true})
map('n', '<leader>t', ':tabnew<CR>', { noremap = true })
map('n', '<Leader>+', ':vertical resize +5<CR>', { noremap = true, silent = true })
map('n', '<Leader>-', ':vertical resize -5<CR>', { noremap = true, silent = true })
map('n', '<leader>t', ':tabnew<CR>', { noremap = true })
map('n', '<leader>fmt', ':Format<CR>', { noremap = true })
map('n', '<leader>q', ':xa<CR>', { noremap = true })
cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]
map('v', '<C-c>', '"*y', { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

wildmenumode = function()
  return fn.wildmenumode() ~= 0
end
map('c', '<space>', 'wildmenumode() ? "<Down>" : "\\<space>"', { noremap = true, expr = true })

-----------------------------------------------------------
-- Nerdtree shortcuts:
-----------------------------------------------------------
map('n', '<leader>.', ':NERDTreeToggle<CR>', default_opts) -- open/close

cmd [[autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]]
g.NERDTreeRespectWildIgnore = 1
