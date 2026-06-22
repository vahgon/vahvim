vim.keymap.set('n', '<leader>z', function() require("zen-mode").toggle({
  window = {
    width = .70
  }
}) end, { desc = "toggle zenmode" })
