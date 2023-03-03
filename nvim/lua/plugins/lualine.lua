return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'nord'
            },
            component_separators = {
                left = '',
                right = ''
            },
            section_separators = {
                left = '',
                right = ''
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {"os.date()", 'windows', 'tabs'},
                lualine_x = {'searchcount', 'diagnostics'},
                lualine_y = {'filename', 'encoding', 'fileformat', 'filesize'},
                lualine_z = {'location', 'progress'}
            }
        }
    end
}
