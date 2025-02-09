------------------------------------------
--            Core Search              --
------------------------------------------
-- Files & History
Keymap("n", "<leader>tff", "<CMD>lua require'telescope.builtin'.find_files()<CR>", { desc = "Find files" })
Keymap("n", "<leader>tfo", "<CMD>lua require'telescope.builtin'.oldfiles()<CR>", { desc = "Recent files" })
Keymap("n", "<leader>tgf", "<CMD>lua require'telescope.builtin'.git_files()<CR>", { desc = "Git files" })
Keymap("n", "<leader>tb", "<CMD>lua require'telescope.builtin'.buffers()<CR>", { desc = "Buffer list" })

-- Text Search
Keymap("n", "<leader>tlg", "<CMD>lua require'telescope.builtin'.live_grep()<CR>", { desc = "Live grep" })
Keymap("n", "<leader>tsh", "<CMD>Telescope search_history<CR>", { desc = "Search history" })
Keymap("n", "<leader>tsp", "<CMD>Telescope spell_suggest<CR>", { desc = "Spell suggestions" })

------------------------------------------
--             LSP Features            --
------------------------------------------
Keymap(
	"n",
	"<leader>ts",
	"<CMD>lua require'telescope.builtin'.lsp_document_symbols()<CR>",
	{ desc = "Document symbols" }
)
Keymap("n", "<leader>tS", "<CMD>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
Keymap("n", "<leader>td", "<CMD>lua require'telescope.builtin'.lsp_definitions()<CR>", { desc = "Go to definition" })
Keymap("n", "<leader>tr", "<CMD>lua require'telescope.builtin'.lsp_references()<CR>", { desc = "Find references" })
Keymap("n", "<leader>ti", "<CMD>Telescope lsp_implementations<CR>", { desc = "Implementations" })
Keymap("n", "<leader>tT", "<CMD>Telescope lsp_type_definitions<CR>", { desc = "Type definitions" })
Keymap("n", "<leader>tdi", "<CMD>Telescope diagnostics<CR>", { desc = "Diagnostics" })

------------------------------------------
--            Git Integration          --
------------------------------------------
Keymap("n", "<leader>tgc", "<CMD>Telescope git_commits<CR>", { desc = "Git commits" })
Keymap("n", "<leader>tgb", "<CMD>Telescope git_branches<CR>", { desc = "Git branches" })
Keymap("n", "<leader>tgs", "<CMD>Telescope git_status<CR>", { desc = "Git status" })

------------------------------------------
--          System & Utilities         --
------------------------------------------
-- Vim System
Keymap("n", "<leader>tm", "<CMD>lua require'telescope.builtin'.marks()<CR>", { desc = "Marks" })
Keymap("n", "<leader>th", "<CMD>lua require'telescope.builtin'.help_tags()<CR>", { desc = "Help tags" })
Keymap("n", "<leader>tvo", "<CMD>Telescope vim_options<CR>", { desc = "Vim options" })
Keymap("n", "<leader>trg", "<CMD>Telescope registers<CR>", { desc = "Registers" })
Keymap("n", "<leader>tcc", "<CMD>Telescope commands<CR>", { desc = "Command history" })
Keymap("n", "<leader>tch", "<CMD>Telescope command_history<CR>", { desc = "Command history" })

-- Development
Keymap("n", "<leader>tq", "<CMD>Telescope quickfix<CR>", { desc = "Quickfix list" })
Keymap("n", "<leader>tll", "<CMD>Telescope loclist<CR>", { desc = "Location list" })
Keymap("n", "<leader>tma", "<CMD>Telescope man_pages<CR>", { desc = "Man pages" })

-- UI Management
Keymap("n", "<leader>tco", "<CMD>Telescope colorscheme<CR>", { desc = "Colorscheme selector" })

------------------------------------------
--           Extended Features         --
------------------------------------------
Keymap("n", "<leader>te", "<CMD>Telescope file_browser<CR>", { desc = "File browser" })
Keymap("n", "<leader>tp", "<CMD>Telescope project<CR>", { desc = "Project management" })
Keymap("n", "<leader>tu", "<CMD>Telescope undo<CR>", { desc = "Undo history" })
