return{
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {},
    config = function(_, opts) require'lsp_signature'.setup({
      max_height = 6,
      max_width = 10,
      wrap = true,
      floating_window = false,
      hint_enable = true,
      hint_prefix = "🤔 ",
    }) end
  }
}
