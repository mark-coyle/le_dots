local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)

require'nvim-web-devicons'.setup { default = true; }

-- Theme transparency
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_italic = 1
vim.g.gruvbox_transparent_bg = 1
vim.g.gruvbox_transparent_bg = true

vim.g.solarized_termtrans = 1
vim.g.solarized_visibility = "high"
vim.g.solarized_diffmode = "high"
vim.g.solarized_extra_hi_groups = 1

vim.g.gruvbox_transparent = true
vim.g.gruvbox_flat_style = "dark"
vim.g.gruvbox_italic_functions = true

cmd 'let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"'
cmd 'let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"'

cmd 'colorscheme rose-pine'
