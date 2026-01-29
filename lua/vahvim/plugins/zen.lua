local g = require('gitsigns')
require('zen-mode').setup({
  on_open = function(win)
    if vim.diagnostic.is_enabled() then
      vim.diagnostic.enable(false)
      g.toggle_signs(false)
    end
  end,
  on_close = function()
    if not vim.diagnostic.is_enabled() then
      vim.diagnostic.enable(true)
    g.toggle_signs(true)
    end
  end,
})

vim.keymap.set('n', '<leader>z', function() require("zen-mode").toggle({
  window = {
    width = .60
  }
}) end, { desc = "toggle zenmode" })
