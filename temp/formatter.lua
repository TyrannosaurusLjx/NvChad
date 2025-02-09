local M = {
	--format python when save
	-- {
	--   'psf/black',
	--   ft = "python",
	--   config = function()
	--     vim.api.nvim_create_autocmd({"BufWritePre"}, {
	--       pattern = "*.py",
	--       callback = function()
	--         vim.cmd("Black")
	--       end
	--     })
	--   end
	-- },
	--lint
	{
		"dense-analysis/ale",
		enabled = false,
		config = function()
			-- Configuration goes here.
			local g = vim.g
			g.ale_ruby_rubocop_auto_correct_all = 1
			g.ale_linters = {
				ruby = { "rubocop", "ruby" },
				lua = { "lua_language_server" },
				python = { "pyright" },
			}
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					markdown = {
						"doctoc",
						-- stop_after_first = false, -- 设置为 false 表示所有格式化器依次运行
					},
					-- python = {
					-- 	-- "isort",
					-- 	-- "autopep8",
					-- 	-- "black",
					-- 	-- "ruff",
					-- 	-- stop_after_first = false, -- 设置为 false 表示所有格式化器依次运行
					-- },

					python = function(bufnr)
						if require("conform").get_formatter_info("ruff_format", bufnr).available then
							return { "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
				},
				--
				-- format_options = {
				-- 	ruff = {
				-- 		args = { "format" },
				-- 		stdin = true, -- 通过 stdin 传递内容
				-- 	},
				-- },
				-- format_options = {
				-- 	autopep8 = {
				-- 		args = { "--ignore=W503" },
				-- 	},
				-- },
			})
		end,
	},
}

return M
