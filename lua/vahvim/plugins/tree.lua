local nvimtree = require('nvim-tree')

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<C-h>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<C-l>', api.tree.change_root_to_node, opts('Down ?:o'))
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  view = {
    width = 35,
    relativenumber = true,
  },
  renderer = {
    indent_markers = { enable = true, },
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '',
          arrow_open = '',
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  on_attach = my_on_attach
})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "open nvim tree" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "open ex at current file" })
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh Ex" })
