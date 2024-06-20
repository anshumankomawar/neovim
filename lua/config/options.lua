-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local map = vim.api.nvim_set_keymap -- set global keymap
local cmd = vim.cmd                 -- execute Vim commands
local exec = vim.api.nvim_exec      -- execute Vimscript
local fn = vim.fn                   -- call Vim functions
local g = vim.g                     -- global variables
local opt = vim.opt                 -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- No Port VIM
-----------------------------------------------------------
vim.cmd('source ~/.config/nvim/lua/config/outdated.vim')

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' ' -- change leader to a space
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.swapfile = false                                 -- don't use swapfile
opt.autochdir = false                                -- auto change current working dir
opt.exrc = true
opt.hlsearch = false                                 -- don't highlight search result
opt.errorbells = false                               -- don't use error bells
opt.nu = true                                        -- show line numbers
opt.wrap = false                                     -- don't wrap lines
opt.backup = false                                   -- don't store file backups
opt.undodir = fn.stdpath('cache') .. '/nvim/undodir' -- path to undo directory
opt.undofile = true                                  -- keep undofile
opt.incsearch = true                                 -- use incremental search
opt.updatetime = 50                                  -- neovim refresh rate (ms)
--opt.relativenumber = true                            -- relative line numbers
--opt.statuscolumn = "%=%{&nu?(&rnu && v:relnum?v:relnum:v:lnum):''} %s"
--opt.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum} %s"
opt.numberwidth = 1
opt.ruler = false -- show the cursor position all the time
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})
opt.termguicolors = true
--opt.showtabline = 2

-------------------------------------------------------------
---- Neovim UI
-------------------------------------------------------------
opt.showmatch = true  -- highlight matching parenthesis
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true  -- ignore lowercase for the whole pattern
opt.cursorline = true -- highlight current line
opt.scrolloff = 8     -- lines below last edited line
--opt.signcolumn = 'no'
opt.signcolumn = 'yes:1'
--opt.colorcolumn = 80

function toggle_signcolumn()
  if vim.wo.signcolumn == 'yes:1' then
    vim.wo.signcolumn = 'no'
  else
    vim.wo.signcolumn = 'yes:1'
  end
end

-- Map the function to a keybinding, e.g., <F5>
vim.api.nvim_set_keymap('n', '<leader>gs', ':lua toggle_signcolumn()<CR>', { noremap = true, silent = true })

-- remove status line and vertical line
opt.fillchars = { eob = " ", vert = " " }
opt.showmode = false            -- don't show curr mode
opt.laststatus = 0              -- remove status from status line
opt.showcmd = false             -- don't show command in status line
opt.cmdheight = 0               -- lines taken up by command
--opt.winbar = "%=%m %f"
g['&statusline'] = '%#Normal# ' -- remove uncessary extensions from staus line


-----------------------------------------------------------
-- POPUP UI
-----------------------------------------------------------
--opt.wildmode = {'longest','list','full'}
opt.wildmenu = true
opt.wildignore = { '*.pyc', '*_build/*', '**/coverage/*', '**/node_modules/*', '**/android/*', '**/iot/*', '**/.git/*' }

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- enable background buffers
opt.history = 100     -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240   -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 2     -- shift 4 spaces when tab
opt.tabstop = 2        -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType python,javatext,markdown,html,xhtml,javascript setlocal cc=0]]
