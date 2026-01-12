local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local logos = require("vahvim.base.logos")

math.randomseed(os.time())
local randIndex = math.random(1, #logos)
dashboard.section.header.val = logos[randIndex]

dashboard.section.buttons.val = {
  dashboard.button('e', '󰄛  New File', '<cmd>ene <CR>'),
  dashboard.button('<leader>ff', '  Find file', '<cmd>Telescope find_files <CR>'),
  dashboard.button('q', '  Quit', '<cmd>q <CR>'),
}

vim.api.nvim_set_hl(0, 'alphafoot', { fg = '#FF69B4', italic = true })

dashboard.section.footer.val = 'vahvim'
dashboard.section.footer.opts = {
  position = 'center',
  hl = 'alphafoot'

}

dashboard.config.layout = {
  { type = "padding", val = 5 },
  dashboard.section.header,
  { type = "padding", val = 3 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer
}

alpha.setup(dashboard.config)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
