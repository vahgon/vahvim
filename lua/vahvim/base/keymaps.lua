--(c)ursor(l)ock to middle of screen
vim.keymap.set('n', '<leader>cl', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, { silent = true, noremap = true, desc = "Lock cursor to middle of terminal" })
vim.keymap.set('n', '<leader>co', function() 
  if (vim.o.scrolloff == 10) or (vim.o.scrolloff == 0) then
    vim.opt.scrolloff = 10 - vim.o.scrolloff 
  end
end, { silent = true, noremap = true, desc = "Set min lines above cursor to default/0" }) -- 10 - scrolloff because 10 is our default value set in opts.lua

--text editing
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "Move selected text up" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "Move selected text down" })
vim.keymap.set('n', '<leader>cc', '"_c', { silent = true, noremap = true, desc = 'Send changed contents to "black hole" register' })
vim.keymap.set('n', '<leader>CC', '"_C', { silent = true, noremap = true, desc = 'Send changed contents to "black hole" register' })

--file actions
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, desc = "Save file" })
vim.keymap.set('n', '<leader>q', '<cmd>wq<CR>', { silent = true, noremap = true, desc = "Save file and close" })
vim.keymap.set('n', '<leader>x', '<cmd>q!<CR>', { silent = true, noremap = true, desc = "Close without saving" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { silent = true, noremap = true, desc = "Close all buffers" })

--splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontally" })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = "Symmetric splits" })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = "Close current split" })
vim.keymap.set('n', '<leader>sc', ':bo 10split<CR>:term<CR>', { desc = "Spawn terminal split" })
vim.keymap.set('n', '<C-left>', '<C-w>h', { desc = "Move to lefthand split" })
vim.keymap.set('n', '<C-down>', '<C-w>j', { desc = "Move to lower split" })
vim.keymap.set('n', '<C-up>', '<C-w>k', { desc = "Move to upper split" })
vim.keymap.set('n', '<C-right>', '<C-w>l', { desc = "Move to righthand plit" })

--tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = "New tab" })
vim.keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })
vim.keymap.set('n', '<leader>th', '<cmd>tabp<CR>', { desc = "Previous tab" })
vim.keymap.set('n', '<leader>tl', '<cmd>tabn<CR>', { desc = "Next tab" })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close tab" })

--terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Terminal normal mode" })

--buffers
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { desc = "Go to next buffer" })
vim.keymap.set('n', '<leader>p', ':bprevious<CR>', { desc = "Go to previous buffer" })
vim.keymap.set('n', '<leader>D', ':bd!<CR>', { desc = "Delete current buffer" })
