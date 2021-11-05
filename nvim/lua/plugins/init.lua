return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true}

    -- Not fast, perhaps furious
    use { 'dstein64/vim-startuptime' }
    use { 'lewis6991/impatient.nvim' }

    -- Development
    use { 'b3nj5m1n/kommentary' }
    use { 'ervandew/supertab' }
    use { 'bronson/vim-trailing-whitespace' }
    use { 'rhysd/committia.vim' }
    use { 'junegunn/vim-easy-align' }
    use { 'ThePrimeagen/harpoon' }

    -- Tests
    use { 'vim-test/vim-test' }

    -- Git
    use { 'ThePrimeagen/git-worktree.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-projectionist' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'sindrets/diffview.nvim' }

    -- Color scheme
    use { 'ayu-theme/ayu-vim' }
    use { 'tjdevries/gruvbuddy.nvim' }
    use { 'morhetz/gruvbox' }
    use { 'tjdevries/colorbuddy.vim' }
    use { 'rose-pine/neovim' }
    use { 'lifepillar/vim-solarized8' }
    use { 'folke/tokyonight.nvim' }
    use { 'EdenEast/nightfox.nvim' }

    -- UI
    use { 'romgrk/barbar.nvim' }
    use { 'onsails/lspkind-nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'preservim/nerdtree' }
    use { 'camgraff/telescope-tmux.nvim' }

    -- Fuzzy finder
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-telescope/telescope.nvim' }

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'quangnguyen30192/cmp-nvim-ultisnips' }
    use { 'nvim-lua/lsp_extensions.nvim' }
    use { 'p00f/nvim-ts-rainbow' }
    use { 'nanotee/sqls.nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

    -- Better syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Status line
    use { 'hoob3rt/lualine.nvim' }

    -- Telescope extensions
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'mark-coyle/telescope-dbcli.nvim' }

    -- Personal Extensions
    use { 'mark-coyle/gh.nvim' }

    -- JS/TS development
    use { 'HerringtonDarkholme/yats.vim' }
    use { 'maxmellon/vim-jsx-pretty' }
    use { 'pangloss/vim-javascript' }
    use { 'leafgarland/typescript-vim' }
    use { 'peitalin/vim-jsx-typescript' }
end)
