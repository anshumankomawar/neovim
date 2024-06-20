return {
  "sho-87/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa-paper').setup({
      undercurl = true,
      transparent = true,
      gutter = false,
      dimInactive = false, -- disabled when transparent
      terminalColors = true,
      commentStyle = { italic = true },
      functionStyle = { italic = false },
      keywordStyle = { italic = false, bold = false },
      statementStyle = { italic = false, bold = false },
      typeStyle = { italic = false },
      colors = { theme = {}, palette = {} }, -- override default palette and theme colors
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save a hlgroup with dark background and dimmed foreground
          -- so that you can use it where you still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    })
    --vim.cmd("colorscheme kanagawa-paper")
    --vim.cmd [[
    --highlight StatusLine ctermbg=NONE guibg=NONE guifg=#d4be98
    --highlight StatusLineNC ctermbg=NONE guibg=NONE
    --set statusline=%{repeat('\ ',winwidth('.'))}
    --highlight FloatBorder ctermbg=NONE guibg=NONE
    --highlight PMenu ctermbg=NONE guibg=NONE
    --highlight NormalFloat ctermfg=223 ctermbg=None guibg=None guifg=#d4be98
    --highlight NvimTreeRootFolder guifg=#c4746e
    --highlight DiagnosticError guifg=#c4746e
    --highlight Error guifg=#c4746e
    --highlight CursorLineNr guifg=#938aa9
    --highlight FzfLuaFzfSpinner guifg=#c4746e
    --highlight IncSearch guifg=#b6927b
    --]]
  end
}
