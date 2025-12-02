--lock cursor to middle of screen
vim.keymap.set('n', '<leader>cl', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, { noremap = true, desc = "Lock cursor to middle of terminal" })

--text editing
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv'", { noremap = true, desc = "Move selected text down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv'", { noremap = true, desc = "Move selected text up" })
vim.keymap.set('n', '<leader>c', '”_c', { noremap = true, desc = 'Send changed contents to "black hole" register' })
vim.keymap.set('n', '<leader>C', '”_C', { noremap = true, desc = 'Send changed contents to "black hole" register' })

--file actions
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { noremap = true, desc = "Save file" })
vim.keymap.set('n', '<leader>q', '<cmd>wq<cr>', { silent = true, noremap = true, desc = "Save file and close" })
vim.keymap.set('n', '<leader>x', '<cmd>q!<cr>', { silent = true, noremap = true, desc = "Close without saving" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', { silent = true, noremap = true, desc = "Close all buffers" })
