-- 不在 vscode 里面使用
if vim.g.vscode then
else
	local map = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	-- xelatexTEX = function ()
	--   local dir = vim.fn.expand("%:p:h")  -- 获取当前文件的目录
	--   local file = vim.fn.expand("%:p")   -- 获取当前文件的完整路径
	--
	--   -- 使用 jobstart 来异步运行 xelatex 命令
	--   vim.fn.jobstart(
	--     { "xelatex", file },  -- 传递命令和文件路径
	--     {
	--       cwd = dir,  -- 设置工作目录为当前文件所在目录
	--       on_stdout = function(_, data)
	--         -- 处理标准输出
	--         if data then
	--           for _, line in ipairs(data) do
	--             print("xelatex output: " .. line)
	--           end
	--         end
	--       end,
	--       on_stderr = function(_, data)
	--         -- 处理错误输出
	--         if data then
	--           for _, line in ipairs(data) do
	--             print("xelatex error: " .. line)
	--           end
	--         end
	--       end,
	--       on_exit = function(_, exit_code)
	--         -- 任务完成时调用
	--         if exit_code == 0 then
	--           print("xelatex finished successfully")
	--         else
	--           print("xelatex finished with error code " .. exit_code)
	--         end
	--       end,
	--     }
	--   )
	-- end
	--
	xelatexTEX = function(timeout, filepath)
		local dir = vim.fn.expand("%:p:h") -- 获取当前文件的目录
		local file = filepath or vim.fn.expand("%:p") -- 获取当前文件的完整路径

		local job_id
		local timer = vim.loop.new_timer()

		-- 定义超时任务
		timer:start(timeout, 0, function()
			print("Timeout reached, terminating xelatex job...")
			-- 终止 job
			if job_id then
				vim.fn.jobstop(job_id)
			end
			timer:stop() -- 停止定时器
		end)

		-- 使用 jobstart 来异步运行 xelatex 命令
		job_id = vim.fn.jobstart(
			{ "xelatex", file }, -- 传递命令和文件路径
			{
				cwd = dir, -- 设置工作目录为当前文件所在目录
				on_stdout = function(_, data)
					-- 处理标准输出
					if data then
						for _, line in ipairs(data) do
							print("xelatex output: " .. line)
						end
					end
				end,
				on_stderr = function(_, data)
					-- 处理错误输出
					if data then
						for _, line in ipairs(data) do
							print("xelatex error: " .. line)
						end
					end
				end,
				on_exit = function(_, exit_code)
					-- 任务完成时调用
					if exit_code == 0 then
						print("xelatex finished successfully")
					else
						print("xelatex finished with error code " .. exit_code)
					end
					-- 任务结束时停止定时器
					timer:stop()
				end,
			}
		)
	end

	map(0, "n", "<F8>", "<CMD>lua xelatexTEX(7000)<CR>", opts)
end
