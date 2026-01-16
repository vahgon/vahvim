require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,preview,noselect',
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded',
    }),
    documentation = cmp.config.window.bordered({
      border = 'rounded',
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-h>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c' }),
    ['<C-x>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'lazydev' },
    { name = 'nvim_lsp'},
    { name = 'luasnip' },
    { name = 'orgmode' },
    { name = 'buffer'  },
    { name = 'path'    },
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      maxwidth = 50,
      ellipsis_char = '...',
    }),
  },
})
