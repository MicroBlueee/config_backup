vim.g.mapleader = " "

local keymap = vim.keymap

--keymap.set("模式", "映射后按键", "原按键")

----------- 可视化模式 ----------
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


------------ 正常模式 -----------
-- 分屏
keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>")
keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>")
keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>")
keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>")
-- 分屏间移动
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-h>", "<C-w>h")
--分屏转置
keymap.set("n", "sv", "<C-w>t<C-w>H")
keymap.set("n", "st", "<C-w>t<C-w>K")
-- 取消搜索高亮
keymap.set("n", "<leader>h", ":nohl<CR>")
-- 保存
keymap.set("n", "S", ":w<CR>")
-- 退出
keymap.set("n", "Q", ":q<CR>")
-- tab
keymap.set("n", "ta", ":tabe<CR>")
keymap.set("n", "tp", ":-tabnext<CR>")
keymap.set("n", "tn", ":+tabnext<CR>")
-- 拼写检查
keymap.set("n", "sc", ":set spell!<CR>")

-------------- 插件 -------------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
