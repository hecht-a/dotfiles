local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Check packer installation
local install_path = fn.stdpath("data") .. "/site/pack/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

packer.startup(function(use)
    -- Packer installer
    use({ "wbthomason/packer.nvim", opt = true })

    -- NCM2
    use({ "ncm2/ncm2" })
    use({ "roxma/nvim-yarp" })

    -- ALE
    use({ "dense-analysis/ale" })

    -- Color Scheme
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("kyazdani42/nvim-web-devicons")

    -- Better mappings
    use("b0o/mapx.nvim")

    -- Status bar
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine_setup")
        end,
    })

    -- Native LSP
    use({
        "simrat39/rust-tools.nvim", -- Rust Custom LSP
        "L3MON4D3/LuaSnip", -- Snippets engine
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", -- LSP config
        "hrsh7th/nvim-cmp", -- Completion engine
        "hrsh7th/cmp-nvim-lsp", -- LSP completion
        "saadparwaiz1/cmp_luasnip", -- Snippets cmp
    })
    require("lsp_setup")

    -- Custom linting
    use({
        "mfussenegger/nvim-lint",
        config = function()
            require("lint_setup")
        end,
    })

    -- Format
    use({
        "mhartington/formatter.nvim",
        config = function()
            require("formatter_setup")
        end,
    })

    -- Terminal
    use({
        "numToStr/FTerm.nvim",
        config = function()
            require("fterm_setup")
        end,
    })

    -- Treesitter
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("autopairs_setup")
        end,
    })
    use({ "windwp/nvim-ts-autotag" })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("treesitter_setup")
        end,
    })

    -- Telescope
    use({
        { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-project.nvim" },
    })
    require("telescope_setup")

    -- Neoclip
    use({ "AckslD/nvim-neoclip.lua" })

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("comment_setup")
        end,
    })

    -- Surround
    use({
        "ur4ltz/surround.nvim",
        config = function()
            require("surround_setup")
        end,
    })

    -- Kitty Conf Highlighting
    use("fladson/vim-kitty")

    -- Auto indent detection
    use("tpope/vim-sleuth")

    -- LazyGit integration
    use("kdheepak/lazygit.nvim")

    -- Indentation and blank lines indicators
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indentblankline_setup")
        end,
    })

    -- Auto Save
    use({
        "Pocco81/auto-save.nvim",
        config = function ()
            require("autosave_setup")
        end
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install()"]() end,
        config = function()
            require("markdown-preview_setup")
        end
    })
 end)
