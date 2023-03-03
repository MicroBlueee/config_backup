return {
    "shaunsingh/nord.nvim",
    config = function()
        -- 主题设定
        vim.cmd [[colorscheme nord]]
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = false
        vim.g.nord_italic = true
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_bold = false

        local highlights = require("nord").bufferline.highlights({
            italic = true,
            bold = true,
            fill = "#181c24"
        })
    end
}
