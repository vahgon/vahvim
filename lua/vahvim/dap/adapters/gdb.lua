require('dap').adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- path to vscode cpptools
  command = '$HOME/Tools/extensions/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- require('dap').adapters.gdb = {
--   id = 'gdb',
--   type = 'executable',
--   command = 'gdb',
--   args = { '--quiet', '--interpreter=dap' }
-- }
