local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
Keymaps("n", { "<leader>gh", "gh" }, "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover doc" })
-- map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
-- map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
Keymaps("n", { "<leader>gd", "gd" }, "<CMD>Lspsaga goto_definition<CR>", { desc = "Go to definition" })
Keymaps("n", { "<leader>gD", "gD" }, "<CMD>Lspsaga peek_definition<CR>", { desc = "Show definition", noremap = false })
Keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
Keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" })
Keymaps("n", { "<leader>gr", "gr" }, "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
Keymaps("n", { "<leader>gs", "gs" }, "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })
Keymap("n", "<leader>grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
Keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format code" })
Keymap("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Show code actions" })
Keymap("n", "<leader>gb", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Show document symbols" })

Keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
Keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
Keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
Keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
Keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
Keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

local ts_select = require "nvim-treesitter.textobjects.select"
local ts_swap = require "nvim-treesitter.textobjects.swap"
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- 文本对象选择映射
Keymap({ "x", "o" }, "af", function()
  ts_select.select_textobject "@function.outer"
end)
Keymap({ "x", "o" }, "if", function()
  ts_select.select_textobject "@function.inner"
end)
Keymap({ "x", "o" }, "ac", function()
  ts_select.select_textobject "@class.outer"
end)
Keymap({ "x", "o" }, "ic", function()
  ts_select.select_textobject "@class.inner"
end)
Keymap({ "x", "o" }, "as", function()
  ts_select.select_textobject "@local.scope"
end)
Keymap("n", "<leader>lsn", function()
  ts_swap.swap_next "@parameter.inner"
end, { desc = "Swap next parameter" })
Keymap("n", "<leader>lsp", function()
  ts_swap.swap_previous "@parameter.inner"
end, { desc = "Swap previous parameter" })
Keymap({ "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
Keymap({ "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
Keymap({ "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
Keymap({ "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

Keymap("n", "<leader>lss", "<CMD>Namu symbols<CR>", { desc = "show symbols " })
