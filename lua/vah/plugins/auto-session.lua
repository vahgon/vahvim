return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        { '<leader>ss', '<cmd>AutoSession save<CR>', desc = 'Save session' },
        { '<leader>sr', '<cmd>AutoSession restore<CR>', desc = 'Restore session' },
        { '<leader>sf', '<cmd>AutoSession search<CR>', desc = 'Search sessions' },
        { '<leader>sa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
    },

    opts = {
    suppressed_dirs = { "~/", "/" },
    },
    config = function()
        require('auto-session').setup({})
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
