return{
-- install without yarn or npm
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
   'img-paste-devs/img-paste.vim',
    -- lazy = false,
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      lazy = false,
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({
            render_modes = { 'n', 'c' , 'i' },
            enabled = not vim.g.vscode -- 在 vscode 中使用会渲染的很奇怪
      })
      end,
  }
}

