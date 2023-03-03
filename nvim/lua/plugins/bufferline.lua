return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup()
  end
}
