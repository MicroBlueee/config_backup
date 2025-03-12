local wezterm = require("wezterm")

return {
	default_prog = { "/run/current-system/sw/bin/nu" },
	-- default_prog = { '/usr/local/bin/zsh' },
	-- default_prog = {'/usr/local/bin/fish'},
	automatically_reload_config = true,
	font = wezterm.font_with_fallback({
		"Berkeley Mono",
		"Maple Mono Normal CN",
		-- 'Apple Color Emoji',
		-- 'MonoLisa',
		-- 'Monoid',
		-- 'Jetbrains Mono',
		-- 'Ligalex Mono',
		-- 'Rec Mono Casual',
		-- 'Operator Mono Lig',
		-- 'Hack FC Ligatured',
		-- 'Iosevka',
		-- 'Victor Mono',
		-- 'Source Code Pro',
		-- 'Hasklug Nerd Font',
		-- 'Cascadia Mono',
		-- 'Hack Nerd Font Mono',
		-- 'Fira Code',
		-- 'Broot Icons Visual Studio Code',
	}),
	-- use_cap_height_to_scale_fallback_fonts = true,
	-- font = wezterm.font('Monoid', { weight = "Light", stretch = "SemiCondensed", style = "Normal" }),
	unicode_version = 14,

	-- color_scheme = "Gruvbox Dark",
	-- color_scheme = "LunariaEclipse (Gogh)",
	-- color_scheme = "Ryuuko",
	-- color_scheme = "Sandcastle (base16)",
	-- color_scheme = "terafox",
	-- color_scheme = "Zenburn",
	-- color_scheme = "Canvased Pastel (terminal.sexy)",
	-- color_scheme = "City Streets (terminal.sexy)",
	color_scheme = "nordfox",
	-- color_scheme = "nord",

	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0.5cell",
	},
	font_size = 13,
	line_height = 1.05,
	-- initial_rows = 25,

	default_cursor_style = "BlinkingUnderline",
	cursor_blink_rate = 700,
	enable_wayland = true,
}
