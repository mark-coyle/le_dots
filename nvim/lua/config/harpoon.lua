local utils = require('utils')

require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    }
})

utils.map('n', '<leader>am', ':lua require("harpoon.mark").add_file()<CR>')
utils.map('n', '<leader>m', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
