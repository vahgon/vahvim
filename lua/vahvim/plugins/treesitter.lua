require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install({
  'c',
  'cpp',
  'objc',
  'python',
  'javascript',
  'typescript',
  'html',
  'css',
  'scss',
  'lua',
  'dockerfile',
  'gitcommit',
  'cmake',
  'csv',
  'http',
  'json',
  'sql',
  'markdown',
  'markdown_inline',
  'bash',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() pcall(vim.treesitter.start) end,
})
