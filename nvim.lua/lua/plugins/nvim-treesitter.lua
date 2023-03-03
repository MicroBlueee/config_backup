return {
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}
