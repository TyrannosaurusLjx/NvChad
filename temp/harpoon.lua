return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      local map = vim.keymap.set
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                  results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
          }):find()
      end
      harpoon:setup()
      map("n", "<C-s>", function() harpoon:list():add() end)
      map("n", "<C-t>", function() toggle_telescope(harpoon:list()) end)
      map("n", "<C-1>", function() harpoon:list():select(1) end)
      map("n", "<C-2>", function() harpoon:list():select(2) end)
      map("n", "<C-3>", function() harpoon:list():select(3) end)
      map("n", "<C-4>", function() harpoon:list():select(4) end)
      -- Toggle previous & next buffers stored within Harpoon list
      map("n", "<C-p>", function() harpoon:list():prev() end)
      map("n", "<C-n>", function() harpoon:list():next() end)
    end
}
