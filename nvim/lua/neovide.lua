if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.opt.guifont = { "Iosevka", "h14" }
  vim.o.guifont = "Victor Mono:h13"
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
  -- vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
