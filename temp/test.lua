local function replace_keycodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, false)
end

function _G.tab_binding()
  -- 记录初始光标位置
  local original_pos = vim.api.nvim_win_get_cursor(0)

  -- 发送 Tabout 操作并延迟检查
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, false, true), "i", true)

  -- 异步检查光标位置是否变化
  vim.schedule(function()
    local new_pos = vim.api.nvim_win_get_cursor(0)
    if new_pos[1] == original_pos[1] and new_pos[2] == original_pos[2] then
      -- 光标未移动，说明 Tabout 未生效，触发 <C-n>
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "i", true)
    end
  end)

  return ""
end
function _G.s_tab_binding()
  if vim.fn.pumvisible() ~= 0 then
    return replace_keycodes "<C-h>"
    -- elseif vim.fn["vsnip#jumpable"](-1) ~= 0 then
    --   return replace_keycodes "<Plug>(vsnip-jump-prev)" f
  else
    return replace_keycodes "<Plug>(TaboutBack)"
  end
end
vim.api.nvim_set_keymap("i", "<C-o>", "<Plug>(Tabout)", { expr = false })
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", { expr = true })
