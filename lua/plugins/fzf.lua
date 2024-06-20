return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      "default",
      fzf_opts = {
        -- Change the pointer symbol
        ['--pointer'] = '❯',
        -- ['--prompt'] = 'MyPrompt> ',
      },
      fzf_colors = {
        -- Define color settings
        --["pointer"] = { "fg", "Error" }, -- Change the pointer color to yellow
        --["hl"]      = { "fg", "Error" },
        --["hl+"]     = { "fg", "Error" },
        --["spinner"] = { "fg", "Pmenu" },
        --["query"]   = { "fg", "Pmenu" },
        --["info"]    = { "fg", "Error" },
        --["gutter"]  = "-1",
        ["hl"]     = { "fg", "Green" },
        ["hl+"]    = { "fg", "Green" },
        ["info"]   = { "fg", "Pmenu" },
        ["gutter"] = "-1",
      },
      winopts = { height = 0.8, width = 0.8 },
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
