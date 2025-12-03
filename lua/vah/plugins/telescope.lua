return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
     },
     config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        telescope.setup({
            defaults = {
                path_display = { 'smart' },
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['gg'] = actions.move_to_top,
                        ['G'] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-h>"] = actions.preview_scrolling_left,
                        ["<C-l>"] = actions.preview_scrolling_right,

                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<C-/>'] = actions.which_key,
                        ['<esc>'] = actions.close,                        

                        ['<PageUp>'] = actions.results_scrolling_up,
                        ['<PageDown>'] = actions.results_scrolling_down
                    },
                },
            },
        })
        telescope.load_extension('fzf')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files" })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Fuzzy find recent files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find string in ./" })
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find string" })
        vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ sort_mru = true }) end, { desc = "Find buffers" })
    end,
}
