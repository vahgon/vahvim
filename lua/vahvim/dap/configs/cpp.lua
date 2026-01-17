local dap = require('dap')
require('vahvim.dap.adapters.gdb')

dap.configurations.cpp = {
  {
    name = "launch file",
    type = "cppdbg",
    request = 'launch',
    program = function()
      return vim.fn.input('path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- dap.configurations.cpp = {
--   {
--     name = "Launch gdb",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     args = {},
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
--   {
--     name = "Launch gdb with args",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     args = function()
--       return vim.split(vim.fn.input({'Arguments: ',}), ' +')
--     end,
--   }
-- }
