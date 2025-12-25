-- https://github.com/bluz71/vim-moonfly-colors
return {
  'bluz71/vim-moonfly-colors',
  name = "moonfly",
  lazy = false,
  priority = 1000,
  config = function()
    require('moonfly').custom_colors({
      red = "#ff5d5d",
      crimson = "#ff5189",
      cranberry = "#e65e72",
      coral = "#f09479",
      cinnamon = "#e9958e",
      orchid = "#e196a2",
      orange = "#de935f",
      yellow = "#e800e4",
      khaki = "#00ff33",
      lime = "#85dc85",
      green = "#8cc85f",
      emerald = "#839bf3",
      turquoise = "#79dac8",
      sky = "#b3f1ff",
      blue = "#80a0ff",
      lavender = "#adadf3",
      violet = "#cf87e8",
      purple = "#ae81ff",
    })
    vim.cmd [[colorscheme moonfly]]
    vim.g.moonflyVirtualTextColor = true
  end,
}
