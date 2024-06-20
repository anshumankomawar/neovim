return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = false,
        update_cwd = false,
      },
      renderer = {
        root_folder_modifier = ":t",
        group_empty = true,
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
            },
          },
        },
      },
      diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "▲",
          error = "✘",
        },
      },
      view = {
        adaptive_size = true,
        side = "left",
      },
    }

    vim.keymap.set("n", "<leader>.", ":NvimTreeToggle<CR>", { silent = true })
  end,
}
