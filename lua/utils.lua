local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function open_url(search_engine, query)
	-- 定义搜索引擎 URL 模板
	local engines = {
		github = "https://github.com/search?q={}",
		gitrepo = "https://github.com/{}",
		google = "https://www.google.com/search?q={}",
		bing = "https://www.bing.com/search?q={}",
		duckduckgo = "https://duckduckgo.com/?q={}",
		zhihu = "https://www.zhihu.com/search?type=content&q={}",
		youtube = "https://www.youtube.com/results?search_query={}",
		bilibili = "https://search.bilibili.com/all?keyword={}",
	}

	-- 替换占位符并打开浏览器
	local url = engines[search_engine]:gsub("{}", query)
	os.execute('open "' .. url .. '"')
end

function Search_in_browser(query)
	local engines = { "google", "github", "bing", "duckduckgo", "youtube", "zhihu", "bilibili", "gitrepo" }

	-- 第一步：选择搜索引擎
	pickers
		.new({}, {
			prompt_title = "Select Search Engine",
			finder = finders.new_table({
				results = engines,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					-- 调用搜索功能
					open_url(selection[1], query or vim.fn.input("Query > "))
				end)
				return true
			end,
		})
		:find()
end

-- 映射到快捷键
vim.keymap.set("v", "?", function()
	-- 获取选中的文本
	-- 复制到寄存器 v
	vim.cmd('normal! "vy')
	local query = vim.fn.getreg(vim.v.register)
	Search_in_browser(query)
end)

Journal = function(n)
	local date = os.date("%Y-%m-%d", os.time() + n * 86400)
	local head = "Journal"
	local fileName = head .. "_" .. date .. ".md"
	local title = "# " .. head .. " " .. date
	local path = vim.fn.expand("~/wiki/" .. fileName)
	local file = io.open(path, "r")
	if file then
		vim.cmd("e " .. path)
	else
		local cmd = "e " .. path
		vim.cmd(cmd)
		vim.fn.append(0, title)
	end
end
