--禁用 md 诊断a-- 这会禁用所有诊断
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "markdown",
--     callback = function()
--       vim.diagnostic.enable(false) -- 禁用当前缓冲区的诊断
--     end,
--   })

-- 在除了输入模式外，关闭输入法(不能输入中文路径)
-- vim.g.neovide_input_ime = true
local function set_ime(args)
	if args.event:match("Enter$") then
		vim.g.neovide_input_ime = true
	else
		vim.g.neovide_input_ime = false
	end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	group = ime_input,
	pattern = "*",
	callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
	group = ime_input,
	pattern = "[/\\?]",
	callback = set_ime,
})

----------
-- local function check_codelens_support()
-- local clients = vim.lsp.get_active_clients({ bufnr = 0 })
-- for _, c in ipairs(clients) do
--   if c.server_capabilities.codeLensProvider then
--     return true
--   end
-- end
-- return false
-- end
--
-- vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave', 'CursorHold', 'LspAttach', 'BufEnter' }, {
-- buffer = bufnr,
-- callback = function ()
--   if check_codelens_support() then
--     vim.lsp.codelens.refresh({bufnr = 0})
--   end
-- end
-- })
-- -- trigger codelens refresh
-- vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
--
-- -- setup Markdown Oxide daily note commands
-- if client.name == "markdown_oxide" then
--
--   vim.api.nvim_create_user_command(
--     "Daily",
--     function(args)
--       local input = args.args
--
--       vim.lsp.buf.execute_command({command="jump", arguments={input}})
--
--     end,
--     {desc = 'Open daily note', nargs = "*"}
--   )
-- end

------------lint
-- au BufWritePost * lua require('lint').try_lint()
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		-- try_lint without arguments runs the linters defined in `linters_by_ft`
-- 		-- for the current filetype
-- 		require("lint").try_lint()
--
-- 		-- You can call `try_lint` with a linter name or a list of names to always
-- 		-- run specific linters, independent of the `linters_by_ft` configuration
-- 		require("lint").try_lint("cspell")
-- 	end,
-- })
------------
