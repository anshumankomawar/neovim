return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
  config = function()
    local lsp = require('lsp-zero')
    lsp.skip_server_setup({'jdtls'})

    lsp.preset('recommended')

    lsp.skip_server_setup({'jdtls'})

    lsp.configure('lua_ls', {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })

    require'lspconfig'.dartls.setup{}

    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })

    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil

    lsp.setup_nvim_cmp({
      preselect = 'none',
      completion = {
          completeopt = 'menu,menuone,noinsert'
      },
      mapping = cmp_mappings
    })

    lsp.set_preferences({
        sign_icons = {
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        }
    })
    lsp.skip_server_setup({'jdtls'})

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      if client.name == "eslint" then
          vim.cmd.LspStop('eslint')
          return
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end)

    lsp.skip_server_setup({'jdtls'})
    lsp.setup()
    local dart_lsp = lsp.build_options('dartls', {})

    require('flutter-tools').setup({
      lsp = {
        capabilities = dart_lsp.capabilities
      }
    })

    vim.diagnostic.config({
        virtual_text = true,
    })

  end
}
