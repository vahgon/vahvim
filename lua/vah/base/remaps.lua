--(c)ursor(l)ock to middle of screen
vim.keymap.set('n', '<leader>cl', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, { silent = true, noremap = true, desc = "Lock cursor to middle of terminal" })

--text editing
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "Move selected text up" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "Move selected text down" })
vim.keymap.set('n', '<leader>c', '"_c', { remap = true, desc = 'Send changed contents to "black hole" register' })
vim.keymap.set('n', '<leader>C', '"_C', { remap = true, desc = 'Send changed contents to "black hole" register' })

--file actions
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, desc = "Save file" })
vim.keymap.set('n', '<leader>q', '<cmd>wq<CR>', { silent = true, noremap = true, desc = "Save file and close" })
vim.keymap.set('n', '<leader>x', '<cmd>q!<CR>', { silent = true, noremap = true, desc = "Close without saving" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { silent = true, noremap = true, desc = "Close all buffers" })

--splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>sh', '<C-w>h', { desc = "Split window horizontally" })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = "Symmetric splits" })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = "Close current split" })
vim.keymap.set('n', '<leader>sc', ':bo :term', { desc = "Spaw small terminal split" })

--tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = "New tab" })
vim.keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })
vim.keymap.set('n', '<leader>th', '<cmd>tabp<CR>', { desc = "Previous tab" })
vim.keymap.set('n', '<leader>tl', '<cmd>tabn<CR>', { desc = "Next tab" })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close tab" })
