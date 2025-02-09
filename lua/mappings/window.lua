------------------------------------------
--            Window Management        --
------------------------------------------
local function setup_window_nav()
	-- 基础窗口导航
	Keymaps("n", { "<leader>wh", "<D-h>" }, "<C-w>h", { desc = "Focus left window" })
	Keymaps("n", { "<leader>wj", "<D-j>" }, "<C-w>j", { desc = "Focus lower window" })
	Keymaps("n", { "<leader>wk", "<D-k>" }, "<C-w>k", { desc = "Focus upper window" })
	Keymaps("n", { "<leader>wl", "<D-l>" }, "<C-w>l", { desc = "Focus right window" })

	-- 动态窗口尺寸调整（自动处理平台差异）
	local meta_key = vim.fn.has("mac") == 1 and "D" or "A" -- Mac: Command, 其他: Alt
	Keymaps("n", {
		"<" .. meta_key .. "-Right>",
		"<leader>w>",
	}, "<C-w>>", { desc = "Increase window width" })

	Keymaps("n", {
		"<" .. meta_key .. "-Left>",
		"<leader>w<",
	}, "<C-w><", { desc = "Decrease window width" })

	Keymaps("n", {
		"<" .. meta_key .. "-Up>",
		"<leader>w+",
	}, "<C-w>+", { desc = "Increase window height" })

	Keymaps("n", {
		"<" .. meta_key .. "-Down>",
		"<leader>w-",
	}, "<C-w>-", { desc = "Decrease window height" })
end

------------------------------------------
--        Smart Split Workflows        --
------------------------------------------
local function setup_smart_splits()
	local split_actions = {
		{
			keys = { "<D-L>", "<leader>wL" },
			cmd = ":vsplit | Telescope buffers",
			desc = "Vertical split + buffer list",
		},
		{
			keys = { "<D-H>", "<leader>wH" },
			cmd = ":vsplit | wincmd h | Telescope buffers",
			desc = "Vertical split left + buffers",
		},
		{
			keys = { "<D-J>", "<leader>wJ" },
			cmd = ":split | Telescope buffers",
			desc = "Horizontal split + buffers",
		},
		{
			keys = { "<D-K>", "<leader>wK" },
			cmd = ":split | wincmd k | Telescope buffers",
			desc = "Horizontal split above + buffers",
		},
	}

	for _, action in ipairs(split_actions) do
		Keymaps("n", action.keys, "<CMD>" .. action.cmd .. "<CR>", { desc = action.desc })
	end
end

------------------------------------------
--         NeoTree Integration         --
------------------------------------------
local function setup_neotree()
	local nt_cmd = function()
		if vim.bo.filetype == "neo-tree" then
			return "Neotree toggle"
		else
			return "Neotree filesystem position=left"
		end
	end

	-- 统一入口点
	Keymaps("n", { "<D-E>", "<leader>e" }, function()
		vim.cmd(nt_cmd())
	end, { desc = "Toggle file explorer" })

	-- 专用缓冲视图
	Keymap("n", "<D-B>", "<CMD>Neotree buffers position=float<CR>", {
		desc = "Show buffer list (float)",
	})
end

------------------------------------------
--         Session Management          --
------------------------------------------
local function setup_sessions()
	Keymap("n", "<D-R>", "<CMD>Telescope session-lens<CR>", { desc = "Manage sessions" })
end

-- 初始化所有模块
setup_window_nav()
setup_smart_splits()
setup_neotree()
setup_sessions()

-- Keymaps("n", { "<leader>wh", "<D-h>" }, "<C-w>h", { desc = "Move left" })
-- Keymaps("n", { "<leader>wj", "<D-j>" }, "<C-w>j", { desc = "Move down" })
-- Keymaps("n", { "<leader>wk", "<D-k>" }, "<C-w>k", { desc = "Move up" })
-- Keymaps("n", { "<leader>wl", "<D-l>" }, "<C-w>l", { desc = "Move right" })
-- Keymaps(
-- 	"n",
-- 	{ "<D-L>", "<leader>wL" },
-- 	"<CMD>:vsplit<CR><CMD>Telescope buffers<CR>",
-- 	{ desc = "Vertical split and list buffers" }
-- )
-- Keymaps(
-- 	"n",
-- 	{ "<D-H>", "<leader>wH" },
-- 	"<CMD>:vsplit<CR><C-w>h<CMD>Telescope buffers<CR>",
-- 	{ desc = "Vertical split and move left" }
-- )
-- Keymaps(
-- 	"n",
-- 	{ "<D-J>", "<leader>wJ" },
-- 	"<CMD>:split<CR><CMD>Telescope buffers<CR>",
-- 	{ desc = "Horizontal split and list buffers" }
-- )
-- Keymaps(
-- 	"n",
-- 	{ "<D-K>", "<leader>wK" },
-- 	"<CMD>:split<CR><C-w>k<CMD>Telescope buffers<CR>",
-- 	{ desc = "Horizontal split and move up" }
-- )
--
-- Keymap("n", "<D-R>", function()
-- 	-- require("persistence").select()
-- 	vim.cmd([[Telescope session-lens]])
-- end)
-- Keymap("n", "<D-E>", function()
-- 	if vim.bo.filetype == "neo-tree" then
-- 		vim.cmd("Neotree toggle")
-- 	else
-- 		vim.cmd("Neotree filesystem position=left")
-- 	end
-- end, { desc = "Toggle Neotree" })
-- Keymap("n", "<D-B>", "<CMD>Neotree buffers position=float<CR>", { desc = "Toggle buffers Neotree" })
-- Keymap("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neotree" })
-- Keymap("n", "<d-right>", "<C-w>>", { desc = "Move window right" })
-- Keymap("n", "<d-left>", "<C-w><", { desc = "Move window left" })
-- Keymap("n", "<d-up>", "<C-w>+", { desc = "Move window up" })
-- Keymap("n", "<d-down>", "<C-w>-", { desc = "Move window down" })
