return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local telescope = require('telescope.builtin')

                vim.keymap.set('n', '<localleader>fD', vim.lsp.buf.declaration, opts)
                vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<localleader>fr', telescope.lsp_references, opts)
                vim.keymap.set('n', '<localleader>fd', telescope.lsp_definitions, opts)
                vim.keymap.set('n', '<localleader>fi', telescope.lsp_implementations, opts)
                vim.keymap.set('n', '<localleader>ft', telescope.lsp_type_definitions, opts)
                vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<localleader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
                vim.keymap.set('n', '<localleader>d', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<localleader>K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<localleader>rl', ':LspRestart<CR>', opts)
            end,
        })
        vim.diagnostic.config({
            virtual_text = true, 
            signs = true,
            update_in_insert = false,
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.HINT] = '',
                    [vim.diagnostic.severity.INFO] = ''
                },
                linehl = false,
                numhl = '',
            },
        })
    end,
}
