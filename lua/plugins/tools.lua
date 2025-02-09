M = {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			preset = "modern",
		},
	},
	{
		"folke/trouble.nvim",
		enabled = true,
		cmd = { "Trouble" },
		opts = {
			auto_close = false, -- auto close when there are no items
			auto_open = false, -- auto open when there are items
			auto_preview = true, -- automatically open preview when on an item
			warn_no_result = false,
			preview = {
				type = "main",
				-- when a buffer is not yet loaded, the preview window will be created
				-- in a scratch buffer with only syntax highlighting enabled.
				-- Set to false, if you want the preview to always be a real loaded buffer.
				scratch = true,
			},

			filters = {
				-- 忽略 W503 错误
				ignore = function(diagnostic)
					return diagnostic.code == "W503"
				end,
			},

			modes = {
				cascade = {
					mode = "diagnostics", -- inherit from diagnostics mode
					filter = function(items)
						local severity = vim.diagnostic.severity.HINT
						for _, item in ipairs(items) do
							severity = math.min(severity, item.severity)
						end
						return vim.tbl_filter(function(item)
							return item.severity == severity
						end, items)
					end,
				},
			},

			-- modes = {
			--   diagnostics_buffer = {
			--     mode = "diagnostics", -- inherit from diagnostics mode
			--     filter = {
			--       any = {
			--         buf = 0, -- current buffer
			--         {
			--           severity = vim.diagnostic.severity.ERROR, -- errors only
			--           -- limit to files in the current project
			--           function(item)
			--             return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
			--           end,
			--         },
			--       },
			--     },
			--   },
			-- }
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		-- config = function()
		--   require("nvim-surround").setup({
		--     -- Configuration here, or leave empty to use defaults
		--
		--   })
		-- end,
		opts = {
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "gys",
				normal_cur = "gySS",
				normal_line = "gyS",
				normal_cur_line = "gySS",
				visual = "gys",
				visual_line = "gyS",
				delete = "gds",
				change = "gcs",
				change_line = "gcS",
			},
		},
	},
	{
		"hedyhli/outline.nvim",
		lazy = false,
		config = function()
			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
	},
	{
		"m4xshen/hardtime.nvim",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	{ "jghauser/mkdir.nvim" },
}

return M
