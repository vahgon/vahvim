local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local logos = require("vahvim.base.logos")

math.randomseed(os.time())
local randIndex = math.random(1, #logos)
dashboard.section.header.val = logos[randIndex]

dashboard.section.buttons.val = {
  dashboard.button('e', '󰄛  New File', '<cmd>ene <CR>'),
  dashboard.button('<leader>ff', '  Find file', '<cmd>Telescope find_files <CR>'),
  dashboard.button('<leader>fg', '  Find word(s)', '<cmd>Telescope live_grep <CR>'),
  dashboard.button('q', '  Quit', '<cmd>q <CR>'),
}

alpha.setup(dashboard.opts)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
