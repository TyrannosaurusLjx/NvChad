return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- 确保 mason.nvim 在启动时加载
    dependencies = { "jay-babu/mason-nvim-dap.nvim" },
    config = function()
      require("mason").setup {
        ensure_installed = {
          "pyright",
          "debugpy",
        },
      } -- 配置 mason 本身
      require("mason-nvim-dap").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false, -- 确保 mason-lspconfig 在启动时加载
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "pyright", "ltex", "pylsp", "markdown_oxide" }, -- 安装并确保这些 LSP 存在
        automatic_installation = true, -- 自动安装未安装的 LSP
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = { "saghen/blink.cmp" },
    lazy = false,
    config = function()
      require "configs.lspconfig"
      -- local capabilities = require("blink.cmp").get_lsp_capabilities()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- local capabilities =
      -- require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- 使用 Neovim 的 LuaJIT 运行时
            },
            diagnostics = {
              globals = { "vim" }, -- 告诉 Lua LSP，`vim` 是一个全局变量
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- 将 Neovim 的运行时文件添加到 LSP 中
            },
          },
        },
      }
      require("lspconfig").markdown_oxide.setup {
        -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
        -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
        -- on_attach = on_attach -- configure your on attach config
      }
      require("lspconfig").pyright.setup {
        capabilities = capabilities,
      }
      require("lspconfig").ts_ls.setup {}
      -------------html
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require("lspconfig").html.setup {
        capabilities = capabilities,
      }
      ---------------

      ---------------typescript
      -- 全局 npm 路径
      local global_node_modules = "/opt/homebrew/lib/node_modules"
      -- 配置 TypeScript LSP
      require("lspconfig").ts_ls.setup {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        init_options = {
          hostInfo = "neovim",
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = global_node_modules .. "/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        on_attach = function(client, bufnr)
          print("LSP attached to buffer " .. bufnr)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      }

      require("lspconfig").volar.setup {
        init_options = {
          typescript = {
            tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
          },
        },
      }
    end,
  },
}
