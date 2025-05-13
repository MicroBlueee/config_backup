-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
local opt = vim.opt

-- 行号
opt.number = true
opt.relativenumber = false

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.expandtab = true

-- 防止包裹
opt.wrap = false
opt.foldmethod = "indent"
opt.foldlevel = 99

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 5
opt.list = true
opt.listchars = {
    eol = "↪",
    tab = "↹ ",
    lead = "↦",
    trail = "›",
    extends = ">",
    precedes = "<",
    space = "·",
    nbsp = "␣",
}
opt.showbreak = "¬"

-- 显示光标所在位置
opt.cursorcolumn = true
opt.cursorline = true

-- 显示命令
opt.showcmd = true

-- 文件路径切换到当前文件目录
opt.autochdir = true

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    -- vim.opt.guifont = { "Iosevka", "h14" }
    vim.opt.guifont = "Maple Mono NF CN:h14"
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    -- vim.g.neovide_fullscreen = true
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
