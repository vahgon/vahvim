require('nvim-autopairs').setup({
  check_ts = true,
  ts_config = {
    lua = { 'strink' },
    javascript = { 'template_string' },
    java = false,
  },
})
require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
