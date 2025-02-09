require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

Keymap = vim.keymap.set

function Keymaps(mode, key_table, rhs, opts)
  for _, lhs in ipairs(key_table) do
    Keymap(mode, lhs, rhs, opts)
  end
end

require "mappings.buffer"
require "mappings.cursor"
require "mappings.window"
require "mappings.telescope"
require "mappings.file"
require "mappings.dap"
require "mappings.lsp-treesitter"
require "mappings.plugin"
require "mappings.note"
require "mappings.nvchad"
