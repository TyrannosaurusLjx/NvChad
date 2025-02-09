local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
		{
			"letieu/harpoon-lualine",
			dependencies = {
				{
					"ThePrimeagen/harpoon",
					branch = "harpoon2",
				},
			},
		},
	},
	config = function()
		local meta = function()
			-- 设置 dir
			local dir = vim.fn.getcwd() or " "
			-- 将当前目录替换为以 ~ 开头的形式
			local home = vim.fn.expand("~")
			if vim.startswith(dir, home) then
				dir = "~" .. dir:sub(#home + 1)
			end

			local file_type = vim.bo.filetype or "NONE"
			local icon = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e")) or "📂"
			local interpreter = vim.fn.exepath(file_type) or "NONE"
			local str = "PATH:" .. "{" .. interpreter .. "}"
			return str
		end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					{
						"windows",
						show_filename_only = true, -- Shows shortened relative path when set to false.
						show_modified_status = true, -- Shows indicator when the window is modified.
						mode = 0, -- 0: Shows window name
						-- 1: Shows window index
						-- 2: Shows window name + window index

						max_length = vim.o.columns * 2 / 3, -- Maximum width of windows component,
						-- it can also be a function that returns
						-- the value of `max_length` dynamically.
						filetype_names = {
							TelescopePrompt = "Telescope",
							dashboard = "Dashboard",
							packer = "Packer",
							fzf = "FZF",
							alpha = "Alpha",
							neotree = "FT",
						}, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )
						disabled_buftypes = {
							"quickfix",
							"prompt",
							"sagaoutline",
						}, -- Hide a window if its buffer's type is disabled
						-- Automatically updates active window color to match color of other components (will be overidden if buffers_color is set)
						use_mode_colors = true,
						windows_color = {
							active = { fg = "#abb2bf", bg = "#282c34", gui = "bold" },
							inactive = { fg = "#5c6370", bg = "#21252b", gui = "italic" },
						},
					},
					-- {
					-- 	"datetime",
					-- 	-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
					-- 	style = "iso",
					-- },
				},
				lualine_b = { "branch", "diff", "location" },
				lualine_c = { "diagnostics", "harpoon2" },
				lualine_x = {
					-- "encoding",
					-- "fileformat",
					"copilot",
					"filetype",
				},
				lualine_y = { meta },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "quickfix", "lazy", "neo-tree" },
		})
	end,
}
return M
