_G.whichkeyStatus = { enabled = true }
require("which-key").setup({ delay = 800, })
vim.keymap.set('n', '<leader>?', function() require("which-key").show({ global = false}) end, { desc = "which-key buffer local keymaps" })
