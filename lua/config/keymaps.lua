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
-- map('n', '<Tab>', ':tabnext<CR>', { noremap = true })
map('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true })
map('n', '<leader>t', ':tabnew<CR>', { noremap = true })
map('n', '<Leader>+', ':vertical resize +5<CR>', { noremap = true, silent = true })
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

vim.o.confirm = true
--vim.api.nvim_create_autocmd("BufEnter", {
--group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
--callback = function()
--local layout = vim.api.nvim_call_function("winlayout", {})
--if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
--vim.cmd("quit")
--end
--end
--})
