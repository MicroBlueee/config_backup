-- 使用gui
require("core.neovide")

-- Vim键位配置
require("core.keymaps")

-- lazy加载
require("pluginit.lazy-init")

require("lazy").setup("plugins")

-- Vim选项加载
require("core.options")

-- 插件配置初始化
require("pluginit.mason-init")

require("pluginit.treesitter-conf")

require("pluginit.autocmp-init")

require("pluginit.outlook")
