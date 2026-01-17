local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set('n', '<localleader>db', dap.toggle_breakpoint, { desc = "set a breakpoint" })
vim.keymap.set('n', '<localleader>dn', dap.continue, { desc = "next step" })
vim.keymap.set('n', '<localleader>dc', dap.run_to_cursor, { desc = "continue to cursor location" })
vim.keymap.set('n', '<localleader>dw', dap.clear_breakpoints, { desc = "clear breakpoints" })
vim.keymap.set('n', '<localleader>dq', dap.terminate, { desc = "terminate dbg session" })

-- dap ui
vim.keymap.set('n', '<localleader>due', "<cmd>lua require('dapui').eval()<cr>", { desc = "eval dapui" })
vim.keymap.set('n', '<localleader>dut', "<cmd>lua require('dapui').open()<cr>")
vim.keymap.set('n', '<localleader>duw', "<cmd>lua require('dapui').close()<cr>")


-- compilation etc...
local function compile()
  local std = vim.fn.input('enter standard: ')
  local path = vim.fn.input('path to src files: ', vim.fn.getcwd() .. '/', 'file')
  local command = 'g++ -g -std=c++' .. std .. ' ' .. path .. ' -o main'

  if path == '' then return end

  vim.fn.input('will execute this command: ', command)
  vim.cmd('silent !clear')

  os.execute(command)
  print('compilation finished')
end

vim.keymap.set('n', '<localleader>cc', compile, { desc = "compile a user specified .cpp file" })
vim.keymap.set('n', '<localleader>m', '!make<cr>', { desc = "run makefile" })

-- implement cmake later
-- vim.keymap.set('n', '<localleader>cm', '', { desc = "run cmake .."})
-- vim.keymap.set('n', '<localleader>cb', '')
