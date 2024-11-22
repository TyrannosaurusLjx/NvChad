return{
    "hrsh7th/nvim-cmp",
    opts = function()
      local config = require "plugins.configs.cmp"
      config.mapping["<CR>"] = nil
      return config
    end,
  }
