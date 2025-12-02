return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = {
            "                                                  ",
            " ██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗██╗███╗   ███╗ ",
            " ██║   ██║██╔══██╗██║  ██║██║   ██║██║████╗ ████║ ",
            " ██║   ██║███████║███████║██║   ██║██║██╔████╔██║ ",
            " ╚██╗ ██╔╝██╔══██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ╚████╔╝ ██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                  ",
        }
        dashboard.section.buttons.val = {
            dashboard.button('e', '󰄛 New File', '<cmd>ene <CR>'),
            dashboard.button('<leader>tf', ' Find file', '<cmd>Telescope find_files <CR>'),
            dashboard.button('<leader>tg', ' Find word(s)', '<cmd>Telescope live_grep <CR>'),
            dashboard.button('q', ' Quit', '<cmd>q <CR>'),
        }

        alpha.setup(dashboard.opts)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
