return{
{
    'SleepySwords/mathjax.nvim',
    -- Replace this with whatever node package manager you use.
    build = 'cd mathjax && yarn install',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      '3rd/image.nvim'
    },
    opts = {}
}
}
