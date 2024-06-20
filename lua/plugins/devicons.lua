return {
  "dgox16/devicon-colorscheme.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("devicon-colorscheme").setup({
      colors = {
        blue = "#7daea3",           -- blue from palette2
        cyan = "#89b482",           -- aqua from palette2
        green = "#a9b665",          -- green from palette2
        magenta = "#d3869b",        -- purple from palette2
        orange = "#e78a4e",         -- orange from palette2
        purple = "#d3869b",         -- purple from palette2
        red = "#ea6962",            -- red from palette2
        white = "#ddc7a1",          -- fg1 from palette2
        yellow = "#d8a657",         -- yellow from palette2
        bright_blue = "#7daea3",    -- blue from palette2
        bright_cyan = "#89b482",    -- aqua from palette2
        bright_green = "#a9b665",   -- green from palette2
        bright_magenta = "#d3869b", -- purple from palette2
        bright_orange = "#e78a4e",  -- orange from palette2
        bright_purple = "#d3869b",  -- purple from palette2
        bright_red = "#ea6962",     -- red from palette2
        bright_yellow = "#d8a657",  -- yellow from palette2
      },
    })
  end
}
