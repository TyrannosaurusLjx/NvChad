return{
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        auto_session_enable_last_session = true,
        auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
        auto_session_enabled =  true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        log_level = "error",
        silent_restore = false,
        -- pre_save_cmds = { ":NvimTreeClose" }
      })
    end,
  }
}
