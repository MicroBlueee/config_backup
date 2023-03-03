require "nvim-treesitter.configs".setup {
  ensure_installed = { "bash", "c", "cpp", "fish", "javascript", "haskell", "html", "java", "llvm", "lua", "rust",
    "typescript", "vim", "help", "python" },
  highlight = { enable = true, },
  indent = { enable = true, },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}
