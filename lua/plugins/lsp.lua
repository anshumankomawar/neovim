return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    { "neovim/nvim-lspconfig" }, -- Required for LSP configuration
    { "onsails/lspkind.nvim" },  -- Adds icons to completion items
    {
      "williamboman/mason.nvim", -- LSP/DAP/formatter/linters installer
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional, integrates mason with lspconfig

    -- Completion plugins
    { "hrsh7th/nvim-cmp" },     -- Required for autocompletion
    { "hrsh7th/cmp-nvim-lsp" }, -- Required for LSP source for nvim-cmp
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",                -- Specify major version
      build = "make install_jsregexp", -- Install JS regexp for LuaSnip
    },

    -- Auto Formatting
    "stevearc/conform.nvim",
  },
  config = function()
    local lsp = require("lsp-zero")
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")

    -- Apply recommended preset
    lsp.preset("recommended")

    -- Configure lua language server for Neovim
    lsp.configure("rust_analyzer", {
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            max_width = 80,     -- Adjust the width as needed
            max_height = 20,    -- Adjust the height as needed
            border = "rounded", -- Optional: Add a border to the hover window
          }
        ),
      },
    })

    lsp.configure("lua_ls", {
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            max_width = 80,     -- Adjust the width as needed
            max_height = 20,    -- Adjust the height as needed
            border = "rounded", -- Optional: Add a border to the hover window
          }
        ),
      },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }, -- Recognize 'vim' as a global variable
          },
        },
      },
    })

    -- Setup for tsserver with custom initialization
    -- Integrate vue-language-server with tsserver
    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
        .. "/node_modules/@vue/language-server"

    lspconfig.tsserver.setup({
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      detach = false,
    })

    -- Setup Volar for Vue 3 development
    lspconfig.volar.setup({})

    -- Setup nvim-cmp for autocompletion
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })

    -- Remove Tab mappings
    cmp_mappings["<Tab>"] = nil
    cmp_mappings["<S-Tab>"] = nil

    lsp.setup_nvim_cmp({
      preselect = "none",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp_mappings,
    })

    -- Set preferences for LSP
    lsp.set_preferences({
      sign_icons = {
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      },
    })

    -- Key mappings for LSP
    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
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

    -- Skip setup for rust_analyzer
    --lsp.skip_server_setup({ "rust_analyzer" })

    -- Global server configuration
    lsp.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    -- Finalize LSP setup
    lsp.setup()

    -- Additional nvim-cmp setup
    cmp.setup({
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        }),
        cmp.setup({
          formatting = {
            format = function(entry, vim_item)
              vim_item.abbr = "  " .. vim_item.abbr
              vim_item.menu = (vim_item.menu or "") .. "  "
              return vim_item
            end,
          },
        }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    vim.diagnostic.config({
      virtual_text = true,
    })

    require("conform").setup({
      formatters_by_ft = {
        lua = { "lua_ls" },
        python = { "black" },
        rust = { "rustfmt" },
        javascript = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
      },
      format_on_save = {
        async = false,
        quiet = true,
        timeout_ms = 10000,
        lsp_fallback = true,
      },
    })
  end,
}
