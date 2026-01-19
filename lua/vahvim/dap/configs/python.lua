require('dap-python').setup(os.getenv("HOME") .. '/.virtualenvs/debugpy/bin/python')

table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'specify python file',
  program = function()
    return vim.fn.input('path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
})
