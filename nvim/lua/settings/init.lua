local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'set tags=./tags,tags;$HOME'
cmd 'set completeopt=menuone,noinsert,noselect'
cmd 'set nowrap'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'swapfile', false)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'hlsearch', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'showmatch', true)
utils.opt('o', 'updatetime', 50)
utils.opt('o', 'colorcolumn', "100")
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'foldenable', false)
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.cmd 'autocmd ColorScheme * highlight RedundantSpaces ctermbg=red'
vim.cmd 'au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown'
