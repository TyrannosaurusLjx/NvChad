--markdown
Keymap("n", "<leader>mp", "<CMD>call mdip#MarkdownClipboardImage()<CR>", { desc = "Paste image from clipboard" })

-- bookmark
Keymaps(
  "n",
  { "<leader>mt", "mt" },
  "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>",
  { desc = "Toggle bookmarks" }
)
Keymaps("n", { "<leader>mm", "mm" }, "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>", { desc = "Add bookmarks" })

------------ copilot-chat
Keymap({ "n", "v" }, "<leader>co", "<CMD>CopilotChatOpen<CR>", { desc = "Open Copilot Chat" })
Keymap({ "n", "v" }, "<leader>cc", "<CMD>CopilotChatClose<CR>", { desc = "Close Copilot Chat" })
Keymap({ "n", "v" }, "<leader>ct", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
Keymap({ "n", "v" }, "<leader>cs", "<CMD>CopilotChatStop<CR>", { desc = "Stop Copilot Chat" })
Keymap({ "n", "v" }, "<leader>cr", "<CMD>CopilotChatReset<CR>", { desc = "Reset Copilot Chat" })
Keymap({ "n", "v" }, "<leader>cfs", "<CMD>CopilotChatSave default<CR>", { desc = "save copilot chat" })
Keymap({ "n", "v" }, "<leader>cfo", "<CMD>CopilotChatLoad default<CR>", { desc = "open copilot chat file" })
-------------copilot suggestion
Keymap("i", "<C-w>", "<CMD>lua require'copilot.suggestion'.accept_word()<CR>", { desc = "accept_word" })
Keymap("i", "<C-a>", "<CMD>lua require'copilot.suggestion'.accept_line()<CR>", { desc = "accept_word" })

---------------Toggle Term
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Keymap("n", "<C-`>", "<CMD>ToggleTerm dir=%:p:h name='main' direction=horizontal<CR>")
Keymap({ "n", "t" }, "<C-`>", "<CMD>lua require('nvchad.term').toggle{ pos = 'sp'}<CR>")

-------------------noice
Keymap("n", "<leader>ms", "<CMD>Noice telescope<CR>", { desc = "search messages" })
Keymap("n", "<leader>mm", "<CMD>Noice all<CR>", { desc = "show all messages" })

----------------- dropbar
local dropbar_api = require "dropbar.api"
Keymap("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
Keymap("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
Keymap("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

Keymap("n", "<leader>tp", "<CMD>Precognition toggle<CR>", { desc = "toggle Precognition" })

-----------------snacks
local Snacks = require "snacks"
Keymap("n", "<leader>spb", function()
  Snacks.picker.buffers()
end, { desc = "Snacks picker buffer" })
Keymap({ "n", "x" }, "<leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse (open)" })

-----------------hlargs
Keymap("n", "<leader>hlt", "<CMD>lua require('hlargs').toggle()<CR>", { desc = "highlight args toggle" })
