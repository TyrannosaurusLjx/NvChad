return{
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    config = function ()
      require("neo-tree").setup({
        sources = {
            "filesystem",
            "buffers",
            "git_status",
        },
        add_blank_line_at_top = true,
        -- source_selector = {
        --     winbar = true,
        --     statusline = true
        -- },
        window = {
          mappings = {
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          }
        }

      })
    end
  }
}
