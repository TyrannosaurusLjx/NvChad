return{
    {
      "hedyhli/outline.nvim",
      ft = {"markdown", "vimwiki", "md", "rmd"},
      config = function()
        require("outline").setup {
          -- Your setup opts here (leave empty to use defaults)
          outline_window = {
            position = "left",
            width = 18,
          },
    }
  end,
},
}