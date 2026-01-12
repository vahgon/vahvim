require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'clangd', "vtsls", "neocmake", "bashls", "ruff", "basedpyright", },
})
