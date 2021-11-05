local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'vD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'vd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>h', '<Cmd>lua vim.lsp.buf.hover({ border = "single" })<CR>', opts)
    buf_set_keymap('n', '<leader>H', '<cmd>lua vim.lsp.buf.signature_help({ border = "single" })<CR>', opts)
    buf_set_keymap('n', '<leader>i', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>dr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>', opts)
    buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>lf",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    else
      print(client.name .. " - does not support formatting")
    end

    if client.resolved_capabilities.code_lens then
      print(client.name .. " - does support code_lens")
      require('virtualtypes').on_attach()
    end


    if client.name == "tsserver" then
      -- disable tsserver formatting if you plan on formatting via null-ls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require("nvim-lsp-ts-utils")

      -- defaults
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,

        -- import all
        import_all_timeout = 5000, -- ms
        import_all_priorities = {
          buffers = 4, -- loaded buffer names
          buffer_content = 3, -- loaded buffer content
          local_files = 2, -- git files or files with relative path markers
          same_file = 1, -- add to existing import statement
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = "eslint",
        eslint_enable_diagnostics = false,
        eslint_opts = {},

        -- formatting
        enable_formatting = false,
        formatter = "prettier",
        formatter_opts = {},

        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "oi", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "ip", ":TSLspImportAll<CR>", opts)
    end
  end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}

require'lspconfig'.solargraph.setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    rootPatterns = { ".git/" },
    settings = {
        solargraph = {
            diagnostics = { true }
        }
    }
}

--[[ require'lspconfig'.sorbet.setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd = {
        "srb",
        "tc",
        "--lsp",
        "--verbose",
        "--disablewatchman"
    },
    filetypes = { "ruby" },
    rootpatterns = { ".git/" }
} ]]

require'lspconfig'.tsserver.setup{
  on_attach= on_attach,
  capabilities = capabilities,
  init_options = {
    documentFormatting = false,
  }
}
