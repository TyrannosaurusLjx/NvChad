return{
    {
      "zbirenbaum/copilot-cmp",
      enabled = false,
      lazy = false,
      config = function ()
        require("copilot_cmp").setup()
      end
    }
}