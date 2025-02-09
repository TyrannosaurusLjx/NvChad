-- 多光标
-- https://github.com/jake-stewart/multicursor.nvim
local M = {
	{
		"jake-stewart/multicursor.nvim",
		config = function()
			local mc = require("multicursor-nvim")

			mc.setup()

			-- set({ "n", "v" }, "<leader>N", function()
			-- 	mc.matchAddCursor(-1)
			-- end)
			-- set({ "n", "v" }, "<leader>S", function()
			-- 	mc.matchSkipCursor(-1)
			-- end)

			-- Add or skip cursor above/below the main cursor.
			-- set({ "n", "v" }, "<up>", function()
			-- 	mc.lineAddCursor(-1)
			-- end)
			-- set({ "n", "v" }, "<down>", function()
			-- 	mc.lineAddCursor(1)
			-- end)
			-- set({ "n", "v" }, "<leader><up>", function()
			-- 	mc.lineSkipCursor(-1)
			-- end)
			-- set({ "n", "v" }, "<leader><down>", function()
			-- 	mc.lineSkipCursor(1)
			-- end)

			-- Add all matches in the document
			-- set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors)

			-- You can also add cursors with any motion you prefer:
			-- set("n", "<right>", function()
			--     mc.addCursor("w")
			-- end)
			-- set("n", "<leader><right>", function()
			--     mc.skipCursor("w")
			-- end)

			-- Rotate the main cursor.
			-- set({ "n", "v" }, "<leader>mr", mc.nextCursor)
			-- set({ "n", "v" }, "<leader>mr", mc.prevCursor)

			-- Delete the main cursor.
			-- set({ "n", "v" }, "<leader>x", mc.deleteCursor)

			-- Easy way to add and remove cursors using the main cursor.
			-- set({ "n", "v" }, "<c-q>", mc.toggleCursor)

			-- Clone every cursor and disable the originals.
			-- set({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors)

			-- set("n", "<esc>", function()
			-- 	if not mc.cursorsEnabled() then
			-- 		mc.enableCursors()
			-- 	elseif mc.hasCursors() then
			-- 		mc.clearCursors()
			-- 	else
			-- 		-- Default <esc> handler.
			-- 	end
			-- end)

			-- bring back cursors if you accidentally clear them
			-- set("n", "<leader>gv", mc.restoreCursors)

			-- Align cursor columns.
			-- set("n", "<leader>a", mc.alignCursors)

			-- Split visual selections by regex.
			-- set("v", "S", mc.splitCursors)

			-- match new cursors within visual selections by regex.
			-- set("v", "M", mc.matchCursors)

			-- Rotate visual selection contents.
			-- set("v", "<leader>t", function()
			-- 	mc.transposeCursors(1)
			-- end)
			-- set("v", "<leader>T", function()
			-- 	mc.transposeCursors(-1)
			-- end)
			-- Jumplist support
			-- set({ "v", "n" }, "<c-i>", mc.jumpForward)
			-- set({ "v", "n" }, "<c-o>", mc.jumpBackward)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { link = "Cursor" })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end,
		branch = "1.0",
	},
}

return M
