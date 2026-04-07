require('nvim-treesitter').setup({
install_dir = vim.fn.stdpath('data') .. '/site'
})

require('nvim-treesitter').install { 
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
}
