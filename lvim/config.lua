--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.list = true
vim.opt.listchars = "eol:¬,tab:→→,trail:~,extends:>,precedes:<,space:␣"
vim.opt.showbreak = "↪"
vim.opt.scrolloff = 5
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.termguicolors = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<S-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-q>"] = ":q<cr>"

lvim.keys.normal_mode["sl"] = ":set splitright<cr>:vsplit<cr>"
lvim.keys.normal_mode["sh"] = ":set nosplitright<cr>:vsplit<cr>"
lvim.keys.normal_mode["sk"] = ":set nosplitbelow<cr>:split<cr>"
lvim.keys.normal_mode["sj"] = ":set splitbelow<cr>:split<cr>"

lvim.keys.normal_mode["sv"] = "<C-w>t<C-w>H"
lvim.keys.normal_mode["st"] = "<C-w>t<C-w>K"

lvim.keys.normal_mode["sc"] = ":set spell!<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["H"] = {
  name = "Hop, QuickFix and CodeRunner",
  c = { "<cmd>HopChar2<cr>", "use HopChar2" },
  w = { "<cmd>HopWord<cr>", "use HopWord" },
  l = { "<cmd>HopLine<cr>", "use HopLine" },
  v = { "<cmd>HopVertical<cr>", "use HopVertical" },
  x = { "<cmd>TroubleToggle quickfix<cr>", "quickfix, bqf" },
  r = { "<cmd>RunCode<cr>", "CodeRunner, Run Code" },
}



-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.terminal.open_mapping = "<C-t>"

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  "frazrepo/vim-rainbow",
  "marko-cerovac/material.nvim",
  "sainnhe/sonokai",
  "sainnhe/everforest",
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true
    end
  },
  "tjdevries/colorbuddy.vim",
  "tjdevries/gruvbuddy.nvim",
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    mkdp_auto_start = 0,
    mkdp_auto_close = 1,
    mkdp_refresh_slow = 0,
    mkdp_command_for_global = 0,
    mkdp_open_to_the_world = 0,
    mkdp_open_ip = '',
    mkdp_browser = 'safari',
    mkdp_echo_preview_url = 0,
    mkdp_browserfunc = '',
    --[[mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ },]]
    mkdp_markdown_css = '',
    mkdp_highlight_css = '',
    mkdp_port = '',
    mkdp_page_title = '「${name}」',
    mkdp_theme = 'dark'
  },
  "rockerBOO/boo-colorscheme-nvim",
  "glepnir/zephyr-nvim",
  "mhartington/oceanic-next",
  "kyazdani42/blue-moon",
  "sainnhe/edge",
  "PHSix/nvim-hybrid",
  "shaunsingh/moonlight.nvim",
  "fenetikm/falcon",
  "savq/melange",
  "ray-x/starry.nvim",
  "kvrohit/substrata.nvim",
  "EdenEast/nightfox.nvim",
  "frenzyexists/aquarium-vim",
  "catppuccin/nvim",
  "rose-pine/neovim",
  "projekt0n/github-nvim-theme",
  "nxvu699134/vn-night.nvim",
  "yashguptaz/calvera-dark.nvim",
  "cpea2506/one_monokai.nvim",
  "tiagovla/tokyodark.nvim",
  "rebelot/kanagawa.nvim",
  "olimorris/onedarkpro.nvim",
  "Everblush/everblush.nvim",
  "Mofiqul/adwaita.nvim",
  "olivercederborg/poimandres.nvim",
  "Yazeed1s/oh-lucy.nvim",
  "yamatsum/nvim-nonicons",
  "xiyaowong/virtcolumn.nvim",
  {
    "michaelb/sniprun",
    build = 'bash ./install.sh',
  },
  {
    "phaazon/hop.nvim",
  },
  "Pocco81/auto-save.nvim",
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" },
    -- build = "yay -S glow",
    config = function() require("glow").setup() end
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "1.*",
    config = function()
      require("window-picker").setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal" },
          },
        },
        other_win_hl_color = "#e35e4f",
      })
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "scalameta/nvim-metals",
    config = function()
      require("user.metals").config()
    end,
  },
  "imsnif/kdl.vim",
  {
    "CRAG666/code_runner.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },
  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require('headlines').setup()
    end,
  },
  {
    "andersevenrud/nordic.nvim",
    config = function()
      -- The table used in this example contains the default settings.
      -- Modify or remove these to your liking (this also applies to alternatives below):
      require('nordic').colorscheme({
        -- Underline style used for spelling
        -- Options: 'none', 'underline', 'undercurl'
        underline_option = 'none',
        -- Italics for certain keywords such as constructors, functions,
        -- labels and namespaces
        italic = true,
        -- Italic styled comments
        italic_comments = false,
        -- Minimal mode: different choice of colors for Tabs and StatusLine
        minimal_mode = false,
        -- Darker backgrounds for certain sidebars, popups, etc.
        -- Options: true, false, or a table of explicit names
        -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
        alternate_backgrounds = false,
        -- Callback function to define custom color groups
        -- See 'lua/nordic/colors/example.lua' for example defitions
        custom_colors = function(c, s, cs)
          return {}
        end
      })
    end
  },
  "rmehri01/onenord.nvim",
  -- "gbprod/nord.nvim",
  { 
    "echasnovski/mini.nvim",
    version = false 
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup{
        show_end_of_line = true,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

lvim.colorscheme = "nord"

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = {
  components.mode,
  "mode"
}
lvim.builtin.lualine.sections.lualine_b = {
  components.branch,
  components.diff
}
lvim.builtin.lualine.sections.lualine_c = {
  components.treesitter,
  "searchcount",
  components.python_env,
  "tabs",
}
lvim.builtin.lualine.sections.lualine_y = {
  components.filename,
  components.encoding,
  "fileformat",
  "filesize"
}
lvim.builtin.lualine.sections.lualine_z = {
  components.location,
  components.scrollbar,
  components.progress
}

lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.extended_mode = true

require("auto-save").setup {
  -- your config goes here
  -- or just leave it empty :)
}

require("hop").setup()

-- example mappings you can place in some other place
-- An awesome method to jump to windows
local picker = require('window-picker')

vim.keymap.set("n", ",w", function()
  local picked_window_id = picker.pick_window({
        include_current_win = true
      }) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

-- Swap two windows using the awesome window picker
local function swap_windows()
  local window = picker.pick_window({
    include_current_win = false
  })
  local target_buffer = vim.fn.winbufnr(window)
  -- Set the target window to contain current buffer
  vim.api.nvim_win_set_buf(window, 0)
  -- Set current window to contain target buffer
  vim.api.nvim_win_set_buf(0, target_buffer)
end

vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })

lvim.builtin.dap.active = true

local dap = require('dap')
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run or Test Target",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

require('code_runner').setup({
  mode = 'float',
  focus = true,
  -- startinsert (see ':h inserting-ex')
  startinsert = true,
  term = {
    --  Position to open the terminal, this option is ignored if mode is tab
    position = "bot",
    -- window size, this option is ignored if tab is true
    size = 12,
  },
  float = {
    -- Key that close the code_runner floating window
    close_key = '<ESC>',
    -- Window border (see ':h nvim_open_win')
    border = "solid",

    -- Num from `0 - 1` for measurements
    height = 0.7,
    width = 0.7,
    x = 0.5,
    y = 0.5,

    -- Highlight group for floating window/border (see ':h winhl')
    border_hl = "FloatBorder",
    float_hl = "Normal",

    -- Transparency (see ':h winblend')
    blend = 0,
  },
  -- put here the commands by filetype
  filetype = {
    javascript = "node",
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    python = "python -u",
    sh = "bash",
    rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    go = "cd $dir && go run $fileName",
  },
})

require("headlines").setup({
  markdown = {
    headline_highlights = {
      "Headline1",
      "Headline2",
      "Headline3",
      "Headline4",
      "Headline5",
      "Headline6",
    },
    codeblock_highlight = "CodeBlock",
    dash_highlight = "Dash",
    quote_highlight = "Quote",
  },
})


