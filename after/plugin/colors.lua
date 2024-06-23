function apply_colors(color)
	color = color or "dracula"

	vim.cmd.colorscheme(color)
end

apply_colors()
