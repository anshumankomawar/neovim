return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- Using protected call
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    -- Configuration
    local actions = require "telescope.actions"
    local builtin = require "telescope.builtin"
    local previewers = require("telescope.previewers")

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}

      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      },
      pickers = {
        --find_files = {
        --theme = "dropdown",
        --}
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          height = 0.75
        },
        sorting_strategy = "ascending",
      }
    }

    -- Setting Telescope Keymaps
    local keymap = vim.keymap.set
    local opts = { silent = true }
    --keymap("n", "<leader>ff", ":Telescope find_files prompt_prefix= <CR>", opts)
    --keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
    --keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
    --keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
    --keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
    --keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
    --keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
    vim.keymap.set('n', '<leader>t', function()
      require('telescope.builtin').builtin { include_extensions = true }
    end)
  end
}
