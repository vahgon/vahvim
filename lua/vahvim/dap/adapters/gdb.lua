require('dap').adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- path to vscode cpptools
  command = os.getenv("HOME") .. '/Tools/extensions/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
