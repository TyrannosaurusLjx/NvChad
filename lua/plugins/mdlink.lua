return{
    {
        'Nedra1998/nvim-mdlink',
        enabled = false,
        lazy = false,
        config = function ()
            require('nvim-mdlink').setup({
                keymap = true,
                cmp = true
              })
        end
    }
}