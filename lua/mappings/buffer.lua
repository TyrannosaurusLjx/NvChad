local harpoon = require("harpoon")
-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

----------------------
Keymap("n", "<leader>bb", "<CMD>e #<CR>", { desc = "Previous buffer" })
Keymaps(
	"n",
	{ "<leader>bd", "<D-w>" },
	"<CMD>lua require('bufdelete').bufdelete(0, false)<CR>",
	{ desc = "Delete buffer" }
)
Keymaps("n", { "<leader>bs", "<D-s>" }, "<CMD>w<CR>", { desc = "Save buffer" })
Keymap("i", "<D-s>", "<ESC><CMD>w<CR>", { desc = "Save buffer" })

Keymaps("n", { "<leader>bp", "<D-[>" }, "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
Keymaps("n", { "<leader>bn", "<D-]>" }, "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "<leader>bt", "<CMD>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
-- map("n", "<leader>bT", "<CMD>BufferLineGroupToggle ungrouped<CR>", { desc = "Pick buffer" })
Keymaps("n", { "<leader>bl", "<D-b>" }, function()
	toggle_telescope(harpoon:list())
end, { desc = "List harpoon buffers" })
Keymap("n", "<leader>ba", function()
	harpoon:list():add()
end, { desc = "Add buffer to harpoon" })
Keymap("n", "<leader>b1", function()
	harpoon:list():select(1)
end, { desc = "Select harpoon buffer 1" })
Keymap("n", "<leader>b2", function()
	harpoon:list():select(2)
end, { desc = "Select harpoon buffer 2" })
Keymap("n", "<leader>b3", function()
	harpoon:list():select(3)
end, { desc = "Select harpoon buffer 3" })
Keymap("n", "<leader>b4", function()
	harpoon:list():select(4)
end, { desc = "Select harpoon buffer 4" })
Keymap("n", "<leader>b5", function()
	harpoon:list():select(5)
end, { desc = "Select harpoon buffer 5" })

Keymaps("n", { "<D-e>", "<leader>be" }, "<CMD>Telescope buffers<CR>", { desc = "List buffers" })
