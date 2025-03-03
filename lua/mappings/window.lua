------------------------------------------
--            Window Management        --
------------------------------------------
local function setup_window_nav()
  -- 基础窗口导航
  Keymaps("n", { "<leader>wh", "<D-H>" }, "<C-w>h", { desc = "Focus left window" })
  Keymaps("n", { "<leader>wj", "<D-J>" }, "<C-w>j", { desc = "Focus lower window" })
  Keymaps("n", { "<leader>wk", "<D-K>" }, "<C-w>k", { desc = "Focus upper window" })
  Keymaps("n", { "<leader>wl", "<D-L>" }, "<C-w>l", { desc = "Focus right window" })
  -- Keymap("n", "<leader>wh", "<C-w>h", { desc = "Focus left window" })
  -- Keymap("n", "<leader>wj", "<C-w>j", { desc = "Focus lower window" })
  -- Keymap("n", "<leader>wk", "<C-w>k", { desc = "Focus upper window" })
  -- Keymap("n", "<leader>wl", "<C-w>l", { desc = "Focus right window" })

  -- 动态窗口尺寸调整（自动处理平台差异）
  local meta_key = vim.fn.has "mac" == 1 and "D" or "A" -- Mac: Command, 其他: Alt
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
      keys = { "<C-L>", "<leader>wL" },
      cmd = ":vsplit | Telescope buffers",
      desc = "Vertical split + buffer list",
    },
    {
      keys = { "<C-H>", "<leader>wH" },
      cmd = ":vsplit | wincmd h | Telescope buffers",
      desc = "Vertical split left + buffers",
    },
    {
      keys = { "<C-J>", "<leader>wJ" },
      cmd = ":split | Telescope buffers",
      desc = "Horizontal split + buffers",
    },
    {
      keys = { "<C-K>", "<leader>wK" },
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
      return "Neotree toggle"
      -- return "Neotree filesystem position=left"
    end
  end

  -- 统一入口点
  Keymaps("n", { "<D-E>", "<leader>e" }, function()
    vim.cmd(nt_cmd())
  end, { desc = "Toggle file explorer" })

  -- 专用缓冲视图
  Keymap("n", "<D-B>", "<CMD>Neotree buffers position=left<CR>", {
    desc = "Show buffer list (float)",
  })
end

------------------------------------------
--         Session Management          --
------------------------------------------
local function setup_sessions()
  Keymap("n", "<D-R>", "<CMD>Telescope session-lens<CR>", { desc = "Manage sessions" })
end

------------------------------------------
--           buffer send                --
------------------------------------------
local function setup_buffer_send()
  -- @param pos string: 目标窗口方向，如 "l" (右), "h" (左), "j" (下), "k" (上)
  local function send_to(pos, split)
    local current_buf = vim.api.nvim_get_current_buf()
    local current_win = vim.api.nvim_get_current_win()

    -- 尝试切换到目标窗口
    vim.cmd("wincmd " .. pos)
    local target_win = vim.api.nvim_get_current_win()

    -- 如果目标窗口和当前窗口相同，则新建窗口
    if target_win == current_win then
      vim.cmd(split)
      vim.cmd("wincmd " .. pos)
      target_win = vim.api.nvim_get_current_win() -- 重新获取目标窗口 ID
    end

    -- 获取新切换到的窗口的 buffer
    local target_buf = vim.api.nvim_win_get_buf(target_win)

    -- 只有当目标窗口的 buffer 与当前 buffer 不同时，才切换 buffer
    if target_buf ~= current_buf then
      vim.api.nvim_win_set_buf(target_win, current_buf)
    end
    -- 切换回原来的位置
    -- 执行 <C-p>
    -- vim.api.nvim
    vim.api.nvim_feedkeys("<C-o>", "n", true)
  end

  -- 绑定快捷键
  Keymap("n", "<leader>wL", function()
    send_to("l", "vsplit")
  end, { desc = "Send buffer to right window" })

  Keymap("n", "<leader>wH", function()
    send_to("h", "vsplit")
  end, { desc = "Send buffer to left window" })

  Keymap("n", "<leader>wJ", function()
    send_to("j", "split")
  end, { desc = "Send buffer to below window" })

  Keymap("n", "<leader>wK", function()
    send_to("k", "split")
  end, { desc = "Send buffer to above window" })
end
-- 初始化所有模块
setup_window_nav()
-- setup_smart_splits()
setup_neotree()
setup_sessions()
setup_buffer_send()

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

