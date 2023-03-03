local opt = vim.opt

-- 行号
opt.number = true

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
opt.listchars = { eol = "¬", tab = "→→", trail = "~", extends = ">", precedes = "<", space = "␣" }
opt.showbreak = "↪"
opt.spell = false
opt.spelllang = "en"

-- 显示光标所在位置
opt.cursorcolumn = true
opt.cursorline = true

-- 显示命令
opt.showcmd = true

-- 文件路径切换到当前文件目录
opt.autochdir = true

