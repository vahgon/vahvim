require('orgmode').setup({
  org_agenda_files = '~/Documents/org/**/*',
  org_default_notes_file = '~/Documents/org/refile.org',
})

local telescope = require('telescope')
telescope.load_extension('orgmode')

vim.keymap.set('n', '<leader>fo', telescope.extensions.orgmode.refile_heading, { desc = 'telescope orgmode refile heading' })
vim.keymap.set('n', '<leader>fh', telescope.extensions.orgmode.search_headings, { desc = 'telescope orgmode search headings' })
vim.keymap.set('n', '<leader>fi', telescope.extensions.orgmode.insert_link, { desc = 'telescope orgmode insert link' })
