local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- copy default mappings here from defaults in next section
  vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
  -- vim.keymap.set('n', '<Tab>',   "<CMD>lua require('nvim-tree-preview').watch()<CR>", {desc = "Preview" })
  -- 运行
  vim.keymap.set('n', '<F8>',    api.node.run.cmd,                    opts('Run Command'))
  vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
  vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
  vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
  vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
  vim.keymap.set('n', 'D',       api.fs.trash,                        opts('Trash'))

  -- 过滤和停止过滤
  vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
  vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
  vim.keymap.set('n', '?',      api.tree.toggle_help,                opts('Help'))
  -- 复制绝对路径
  vim.keymap.set('n', 'yy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))

  vim.keymap.set('n', 'ge',      api.fs.copy.basename,                opts('Copy Basename'))
  vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
  vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
  vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
  vim.keymap.set('n', 'L',       api.node.open.toggle_group_empty,    opts('Toggle Group Empty'))
  -- 标记文件很好用
  vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
  vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))

  vim.keymap.set('n', 'o',       function ()
    api.node.open.edit()
    vim.cmd("NvimTreeFocus")
  end,               opts('Open'))

  vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
  -- 导航到父目录
  vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))

  vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))

  vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
  vim.keymap.set('n', 'e',       api.fs.rename_basename,              opts('Rename: Basename'))

  vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))

  vim.keymap.set('n', "<D-o>",   api.node.run.system,                 opts('Run System'))
  vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
  vim.keymap.set('n', 'u',       api.fs.rename_full,                  opts('Rename: Full Path'))

  vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
  vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
  vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', "s", "<CMD>lua require('flash').jump() <CR>", {desc = "Flash" })
  vim.keymap.set("n", "-", "<CMD>:NvimTreeResize 20<CR>")
  vim.keymap.set("n", "=", "<CMD>:NvimTreeResize 35<CR>")
end

return {
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    },

  config = function ()
        require("nvim-tree").setup({
          filters = { dotfiles = false , git_ignored = false,},
          disable_netrw = true,
          git = { timeout = 1000 },

          hijack_cursor = true,
          sync_root_with_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = false,
          },
          renderer = {
              root_folder_label = false,
              highlight_git = true,
              indent_markers = { enable = true },
              icons = {
                glyphs = {
                  default = "󰈚",
                  folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                  },
                  git = { unmerged = "" },
                },
              },
            },
          view = {
            width = 30,
            preserve_window_proportions = true,
          },
          on_attach = my_on_attach,
          respect_buf_cwd = true,
        })
  end
  }
}
