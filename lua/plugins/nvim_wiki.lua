return{
  {
      dir = "~/nvimwiki",
      lazy = false,
      filetypes = {md = true, rmd = true, markdown = true},
      dependencies = {
          "nvim-lua/plenary.nvim", -- 声明依赖 plenary.nvim
          "kkharji/sqlite.lua",
      },
      config = function ()
        require"nvimwiki".setup()
      end
}
}