return {
  "nvim-tree/nvim-tree.lua",
  -- dependencies = {
  --   "nvim-tree/nvim-web-devicons", -- optional, for file icons
  -- },
  version = "nightly",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup()
  end -- optional, updated every week. (see issue #1193)
}
