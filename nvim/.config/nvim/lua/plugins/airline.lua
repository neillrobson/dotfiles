return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        require('lualine').setup {
            tabline = {
                lualine_a = {},
                lualine_b = {'buffers'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'tabs'},
                lualine_z = {}
            }
        }
    end
}

