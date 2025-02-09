M = {
	{
		"famiu/bufdelete.nvim",
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							highlight = "Directory",
							separator = true, -- use a "true" to enable the default, or set your own character
						},
						{
							filetype = "Outline",
							text = "Outline",
							separator = true,
						},
					},

					mode = "buffers", -- set to "tabs" to only show tabpages instead
					style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
					themable = false, -- | false, -- allows highlight groups to be overriden i.e. sets highlights as default
					numbers = "ordinal", ---"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
					right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
					left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
					indicator = {
						icon = "▎", -- this should be omitted if indicator style is not 'icon'
						style = "icon", -- | 'underline' | 'none',
					},
					buffer_close_icon = "󰅖",
					modified_icon = "● ",
					close_icon = " ",
					left_trunc_marker = " ",
					right_trunc_marker = " ",
					--- name_formatter can be used to change the buffer's label in the bufferline.
					--- Please note some names can/will break the
					--- bufferline so use this at your discretion knowing that it has
					--- some limitations that will *NOT* be fixed.
					-- name_formatter = function(buf)  -- buf contains:
					--       -- name                | str        | the basename of the active file
					--       -- path                | str        | the full path of the active file
					--       -- bufnr               | int        | the number of the active buffer
					--       -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
					--       -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
					-- end,
					max_name_length = 18,
					max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
					truncate_names = true, -- whether or not tab names should be truncated
					tab_size = 18,
					diagnostics = "nvim_lsp", --- | "nvim_lsp" | "coc",
					separator_style = "thin", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
				-- highlights = {
				--      fill = {
				--       ctermbg = '#24283b',
				--       bg = '#24283b'
				--     },
				-- }
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})
		end,
	},
}

return M
