local utils = require('utils')

require('diffview').setup()

utils.map('n', '<leader>gv', ':DiffviewOpen<CR>')
utils.map('n', '<leader>gc', ':DiffviewClose<CR>')
utils.map('n', '<leader>gr', ':DiffviewFocusFiles<CR>')
utils.map('n', '<leader>gt', ':DiffviewToggleFiles<CR>')

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '|', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n gn'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n gp'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    ['n gs'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n gb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    ['n <leader>gb'] = '<cmd>:GBrowse<CR>',

    ['n <leader>gu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>ga'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}
