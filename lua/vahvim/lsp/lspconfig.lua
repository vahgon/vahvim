vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local telescope = require('telescope.builtin')
    -- telescope
    vim.keymap.set('n', '<localleader>fr', telescope.lsp_references, { desc = "Displays references to symbol under cursor", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>fd', telescope.lsp_definitions, { desc = "Opens definition of symbol under cursor in new buffer", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>fi', telescope.lsp_implementations, { desc = "Search for implementations of symbol under cursor", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>ft', telescope.lsp_type_definitions, { desc = "Opens type definition of symbol in new buffer", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>fD', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = "Search diagnostics in current buffer", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>rl', ':LspRestart<CR>', { desc = "Restart lsp", buffer = ev.buf, silent = true })

    vim.keymap.set('n', '<localleader>fD', vim.lsp.buf.declaration, { desc = "Jump to declaration of symbol under cursor", buffer = ev.buf, silent = true })
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Displays code actions at cursor position", buffer = ev.buf, silent = true })
    vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, { desc = "Rename symbol under cursor", buffer = ev.buf, silent = true })

    -- diagnostic window mappings
    vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.jump({ pos = vim.api.nvim_win_get_cursor(0), count = 1, float = true }) end, { desc = "jump to next diagnostic in floating window"})
    vim.keymap.set('n', '<leader>dN', function() vim.diagnostic.jump({ pos = vim.api.nvim_win_get_cursor(0), count = -1, float = true }) end, { desc = "jump to prev diagnostic in floating window"})
    vim.keymap.set('n', '<leader>da', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "toggle diagnostic" })
    vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = "Displays diagnostic information under cursor", buffer = ev.buf, silent = true })
  end,
})

vim.diagnostic.config({
  virtual_text = {
    update_in_insert = false,
    virt_text_hide = true,
    virt_text_pos = 'eol'
  },
  update_in_insert = false,
  float = {
    focusable = false,
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = ''
    },
  },
})

-- lsp window / diagnostic coloring
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "#000000", fg = "#839bf3" })

local diagnostics = vim.api.nvim_set_hl
diagnostics(0, "DiagnosticError", { fg = "#FF2800" })
diagnostics(0, "DiagnosticWarn", { fg = "#EED202" })
diagnostics(0, "DiagnosticInfo", { fg = "#FFFFFF" })
diagnostics(0, "DiagnosticHint", { fg = "#00F7EF"})

diagnostics(0, "DiagnosticVirtualTextError", { fg = "#FF2800" })
diagnostics(0, "DiagnosticVirtualTextWarn", { fg = "#EED202" })
diagnostics(0, "DiagnosticVirtualTextInfo", { fg = "#FFFFFF" })
diagnostics(0, "DiagnosticVirtualTextHint", { fg = "#00F7EF" })

diagnostics(0, "DiagnosticFloatingError", { fg = "#FF2800" })
diagnostics(0, "DiagnosticFloatingWarn", { fg = "#EED202" })
diagnostics(0, "DiagnosticFloatingInfo", { fg = "#FFFFFF" })
diagnostics(0, "DiagnosticFloatingHint", { fg = "#00F7EF" })

diagnostics(0, "DiagnosticSignError", { fg = "#FF2800" })
diagnostics(0, "DiagnosticSignWarn", { fg = "#EED202" })
diagnostics(0, "DiagnosticSignInfo", { fg = "#FFFFFF"})
diagnostics(0, "DiagnosticSignHint", { fg = "#00F7EF" })

diagnostics(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF2800" })
diagnostics(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#EED202" })
diagnostics(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#FFFFFF" })
diagnostics(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#00F7EF"})
