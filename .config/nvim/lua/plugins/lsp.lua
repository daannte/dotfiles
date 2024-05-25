return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        basedpyright = {},
        ruff_lsp = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local servers = opts.servers

      -- Setup Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { silent = true })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })

          if client.supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", function()
              require("telescope.builtin").lsp_definitions({ reuse_win = true })
            end, { silent = true })
          end
          if client.supports_method("textDocument/signatureHelp") then
            vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { silent = true })
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { silent = true })
          end
          if client.supports_method("text/codeAction") then
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { silent = true })
          end
        end,
      })

      -- Setup Diagnostic Signs
      local diagnostic_signs = {
        Error = "x ",
        Warn = "! ",
        Hint = "# ",
        Info = "i ",
      }

      for name, icon in pairs(diagnostic_signs) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      -- Setup servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      -- For adding completion to the servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      for server, server_opts in pairs(servers) do
        server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        lspconfig[server].setup(server_opts)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Auto Format
  {
    "stevearc/conform.nvim",
    event = { "BufWrite" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>cm", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
