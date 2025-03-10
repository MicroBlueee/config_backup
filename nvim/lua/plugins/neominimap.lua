---@module "neominimap.config.meta"
return {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value

        --- Put your configuration here

        vim.g.neominimap = {
            auto_enable = true,
            float = {
                window_border = "none"
            },
            search = {
                enabled = true,
            },
        }
    end
}
