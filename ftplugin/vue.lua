vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue",
	callback = function()
		vim.bo.commentstring = "<!--%s*-->"
	end,
})
