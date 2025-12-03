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
                local telescope = require('telescope.builtin')

                vim.keymap.set('n', '<localleader>fD', vim.lsp.buf.declaration, { desc = "Jump to declaration of symbol under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Displays code actions at cursor position", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>fr', telescope.lsp_references, { desc = "Displays references to symbol under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>fd', telescope.lsp_definitions, { desc = "Opens definition of symbol under cursor in new buffer", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>fi', telescope.lsp_implementations, { desc = "Search for implementations of symbol under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>ft', telescope.lsp_type_definitions, { desc = "Opens type definition of symbol in new buffer", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, { desc = "Rename symbol under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = "Search diagnostics in current buffer", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>cd', vim.diagnostic.open_float, { desc = "Displays diagnostic information under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic", buffer = ev.buf, silent = true })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>K', vim.lsp.buf.hover, { desc = "Displays hover info in floating window of symbol under cursor", buffer = ev.buf, silent = true })
                vim.keymap.set('n', '<localleader>rl', ':LspRestart<CR>', { desc = "Restart lsp", buffer = ev.buf, silent = true })
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
                    [vim.diagnostic.severity.ERROR] = '',
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
