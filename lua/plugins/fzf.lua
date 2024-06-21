return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    --local fzf_defaults = require("fzf-lua.defaults").defaults
    --vim.cmd [[
    --highlight FzfLuaPath guifg=#7daea3
    --highlight FzfLuaLineNr guifg=#7daea3
    --highlight FzfLuaMatch guifg=#7daea3
    --]]

    require("fzf-lua").setup({
      fzf_opts = {
        ['--pointer'] = '❯',
        --['--layout'] = 'reverse-list'
      },
      fzf_colors = {
        ---- kanagawa color changes
        --["pointer"] = { "fg", "Error" }, -- Change the pointer color to yellow
        --["hl"]      = { "fg", "Error" },
        --["hl+"]     = { "fg", "Error" },
        --["spinner"] = { "fg", "Pmenu" },
        --["info"]    = { "fg", "Special" },
        --["query"]   = { "fg", "Normal" },
        --["fg"]      = { "fg", "Normal" },
        --["fg+"]     = { "fg", "Normal" },
        --["gutter"]  = "-1",

        ---- gruvbox color changes
        ["hl"]     = { "fg", "Green" },
        ["hl+"]    = { "fg", "Green" },
        ["info"]   = { "fg", "Pmenu" },
        ["gutter"] = "-1",
      },
      --grep = {
      --rg_opts =
      ----blue 0x87,0xaf,0xd7
      ----white 0xdc,0xd7,0xba
      ----orange 0xb6,0x92,0x7b
      --'--colors "match:fg:0x87,0xaf,0xd7" --colors "path:fg:0xdc,0xd7,0xba" --colors "line:fg:0xdc,0xd7,0xba" '
      --.. fzf_defaults.grep.rg_opts,
      --},
      winopts = {
        height  = 0.90, -- window height
        width   = 0.80, -- window width
        row     = 0.50, -- window row position (0=top, 1=bottom)
        col     = 0.50,
        preview = {
          vertical = 'down:60%',
          layout   = "vertical",
          wrap     = 'wrap'
        }
      },
      defaults = {
        git_icons   = false,
        file_icons  = false,
        no_header   = true, -- hide grep|cwd header?
        no_header_i = true, -- hide interactive header?
      },
      files = {
        prompt = 'Files❯ ',
      },
    })
    local keymap = vim.keymap.set
    local opts = { silent = true }
    keymap("n", "<leader>ff", ":FzfLua files<CR>", opts)
    keymap("n", "<leader>fg", ":FzfLua live_grep<CR>", opts)
  end
}
