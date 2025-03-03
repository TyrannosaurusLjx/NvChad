local M = {
  formatters_by_ft = {
    lua = { "stylua" },
    markdown = { "deno_fmt", "doctoc", stop_after_first = false },
    python = { "ruff_format" },
    tex = { "latexindent" },
    bib = { "bibtex-tidy" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format { bufnr = args.buf }
    end,
  }),
}

return M
