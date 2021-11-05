local telescope = require('telescope')
local utils = require('utils')

telescope.setup {
  defaults = {
    layout_strategy = "vertical"
  },
  selection_strategy = "reset",
  sorting_strategy = "descending",
  scroll_strategy = "cycle",
  extensions = {
    dbcli = {
      mssql_cli = {
        history_file = os.getenv('HOME') .. "/.config/mssqlcli/history",
        prompt_title = 'Mssql-cli History',
      },
      on_query_select = {
        open_in_scratch_buffer = true,
        add_query_to_register = false
      }
    },
  }
}

telescope.load_extension('fzy_native')
telescope.load_extension('dbcli')
telescope.load_extension('git_worktree')

local M = {}

M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = '< Dotfiles >',
    cwd = '$HOME/dotfiles/'
  })
end

M.notes = function()
  require('telescope.builtin').find_files({
    prompt_title = '< Notes >',
    cwd = '$HOME/Desktop/Notes/'
  })
end

-- Telescope

utils.map('n', '<C-p>', ':lua require("telescope.builtin").find_files(require("telescope.themes").get_ivy({}))<CR>')
utils.map('n', '<C-g>', ':lua require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({}))<CR>')
utils.map('n', '<leader>rg', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ")})<CR>')
utils.map('n', '<leader>rw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
utils.map('n', '<leader>cs', ':lua require("telescope.builtin").colorscheme()<CR>')
utils.map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
utils.map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
utils.map('n', '<leader>df', ':lua require("config.telescope").search_dotfiles()<CR>')
utils.map('n', '<leader>sn', ':lua require("config.telescope").notes()<CR>')
utils.map('n', '<leader>gw', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
utils.map('n', '<leader>pg', ':lua require("telescope").extensions.dbcli.pgcli()<CR>')
utils.map('n', '<leader>ms', ':lua require("telescope").extensions.dbcli.mssql_cli()<CR>')

-- Telescope tmux
utils.map('n', '<leader>ts', ':Telescope tmux sessions<CR>')
utils.map('n', '<leader>tw', ':Telescope tmux windows<CR>')

return M
