local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh') -- Clear highlights

-- Window & Movement mappings

utils.map('n', 'ss', ':split')
utils.map('n', 'sv', ':vsplit')
utils.map('n', 'fw', ':FixWhitespace')
utils.map('n', 'fn', ':echo expand("%:p")')


utils.map('n', '<Space>', '<C-w>w')
utils.map('n', 's<left>', '<C-w>h')
utils.map('n', 's<up>', '<C-w>k')
utils.map('n', 's<down>', '<C-w>j')
utils.map('n', 's<right>', '<C-w>l')

utils.map('n', 'sh', '<C-w>h')
utils.map('n', 'sj', '<C-w>j')
utils.map('n', 'sk', '<C-w>k')
utils.map('n', 'sl', '<C-w>l')

utils.map('n', '<S-Tab>', ':tabprev<Return>')
utils.map('n', '<Tab>', ':tabnext<Return>')
utils.map('n', 'te', ':tabnew<Return><C-w>w')

utils.map('n', '<Up>', '<Nop>')
utils.map('n', '<Down>', '<Nop>')
utils.map('n', '<Left>', '<Nop>')
utils.map('n', '<Right>', '<Nop>')

-- Custom functionality
utils.map('n', 'K', 'i<CR><Esc>')
utils.map('n', '<leader>pr', ':PROverview<CR>')

-- VimTest
utils.map('n', '<leader>tf', ':TestFile<CR>')
utils.map('n', '<leader>tn', ':TestNearest<CR>')
utils.map('n', '<leader>tl', ':TestLast<CR>')

-- Buffer Management
utils.map('n', '<leader>cb', ':BufferCloseAllButCurrent')
