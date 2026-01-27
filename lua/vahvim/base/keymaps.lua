--(c)ursor(l)ock to middle of screen
vim.keymap.set('n', '<leader>cl', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, { silent = true, noremap = true, desc = "Lock cursor to middle of terminal" })

vim.keymap.set('n', '<leader>co', function()
  if (vim.o.scrolloff == 10) or (vim.o.scrolloff == 0) then
    vim.opt.scrolloff = 10 - vim.o.scrolloff
  end
end, { silent = true, noremap = true, desc = "Set min lines above cursor to default" }) -- 10 - scrolloff because 10 is our default value set in opts.lua

--text editing
vim.keymap.set('n', '<leader>cc', '"_c', { silent = true, noremap = true, desc = "send changed contents to \"black hole\" register" })
vim.keymap.set('n', '<leader>CC', '"_C', { silent = true, noremap = true, desc = "send changed contents to \"black hole\" register" })

vim.keymap.set('i', '<S-Tab>', '<C-d>', { silent = true, noremap = true, desc = "shift left" })
vim.keymap.set('v', '<S-Tab>', '<', { silent = true, noremap = true, desc = "shift left" })
vim.keymap.set('v', '<Tab>', '>', { silent = true, noremap = true, desc = "shift right"})

--file actions
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { noremap = true, desc = "save file" })
vim.keymap.set('n', '<leader>q', '<cmd>wq<cr>', { silent = true, noremap = true, desc = "save file and close" })
vim.keymap.set('n', '<leader>x', '<cmd>q!<cr>', { silent = true, noremap = true, desc = "close without saving" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', { silent = true, noremap = true, desc = "close all buffers" })

--splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "split window vertically" })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "split window horizontally" })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = "symmetric splits" })
vim.keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = "close current split" })
vim.keymap.set('n', '<leader>sc', ':bo 10split<cr>:term<cr>', { desc = "spawn terminal split" })
vim.keymap.set('n', '<C-left>', '<C-w>h', { desc = "move to lefthand split" })
vim.keymap.set('n', '<C-down>', '<C-w>j', { desc = "move to lower split" })
vim.keymap.set('n', '<C-up>', '<C-w>k', { desc = "move to upper split" })
vim.keymap.set('n', '<C-right>', '<C-w>l', { desc = "move to righthand plit" })

--tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', { desc = "new tab" })
vim.keymap.set('n', '<leader>tb', '<cmd>tabnew %<cr>', { desc = "open current buffer in new tab" })
vim.keymap.set('n', '<leader>th', '<cmd>tabp<cr>', { desc = "previous tab" })
vim.keymap.set('n', '<leader>tl', '<cmd>tabn<cr>', { desc = "next tab" })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<cr>', { desc = "close tab" })

--terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "terminal normal mode" })

--buffers
vim.keymap.set('n', '<leader>l', ':bnext<cr>', { desc = "go to next buffer" })
vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { desc = "go to previous buffer" })
vim.keymap.set('n', '<leader>D', ':bd!<cr>', { desc = "delete current buffer" })

--sessions
vim.keymap.set('n', '<leader>ss', ':mksession!<cr>', { desc = "create session file" })
