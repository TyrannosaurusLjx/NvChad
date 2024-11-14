-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "ltex",  }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig['pyright'].setup{
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = require('lspconfig').util.root_pattern('.git', 'pyrightconfig.json', 'pyproject.toml', 'setup.py', 'requirements.txt'),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = false,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        venvPath = "./envs",  -- 设置虚拟环境的路径
        pythonPath = "/opt/homebrew/anaconda3/envs/venv/bin/python",  -- 确保指向正确的虚拟环境 Python
      }
    }
  }
}


lspconfig['ltex'].setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ltex = {
      language = "en",  -- 设置语言为英语
      diagnosticSeverity = "information",  -- 设置诊断级别为信息
      filetypes = { "text", "latex", "bibtex", "plaintex", "markdown" },  -- 不包含 markdown 文件
    }
  },
  -- 你可以显式设置要应用 `ltex` 的文件类型
  -- 只会在这些文件类型中启用 `ltex`
  -- 例如：只对 `text`, `latex`, `bibtex` 文件启用 `ltex`
  -- filetypes = { "text", "latex", "bibtex" },
}
