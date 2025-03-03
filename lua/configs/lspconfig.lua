-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "ruff", "vuels", "volar" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pyright.setup {
  settings = {
    python = {
      pythonPath = "/opt/homebrew/anaconda3/envs/ml/bin/python",
    },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.markdown_oxide.setup {
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

lspconfig.lua_ls.setup {
  -- capabilities = capabilities,
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
