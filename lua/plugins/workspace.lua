return{
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    config = function ()
      require("workspaces").setup({
        path = vim.fn.stdpath("data") .. "/workspaces",
        sort = true,
        -- option to automatically activate workspace when opening neovim in a workspace directory
        auto_open = true,
        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {},
          open = {
            "SessionRestore",
            "NvimTreeOpen",
          },
        },

      })
    end
  }
}
