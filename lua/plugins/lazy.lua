-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        {
            "sainnhe/gruvbox-material",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd('colorscheme gruvbox-material')
            end
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true
        },
        {
            "nvim-telescope/telescope.nvim",
            lazy = false,
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            },
            config = function()
                require('lualine').setup {
                    options = {
                        icons_enabled = false,
                        theme = 'gruvbox',
                        component_separators = { left = '|', right = '|'},
                        section_separators = { left = '', right = ''},
                        disabled_filetypes = {
                            statusline = {},
                            winbar = {},
                        },
                        ignore_focus = {},
                        always_divide_middle = true,
                        globalstatus = false,
                        refresh = {
                            statusline = 1000,
                            tabline = 1000,
                            winbar = 1000,
                        }
                    },
                    sections = {
                        lualine_a = {'mode'},
                        lualine_b = {'branch', 'diff', 'diagnostics'},
                        lualine_c = {'filename'},
                        lualine_x = {'filetype'},
                        lualine_y = {'progress'},
                        lualine_z = {'location'}
                    },
                    inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = {'filename'},
                        lualine_x = {'location'},
                        lualine_y = {},
                        lualine_z = {}
                    },
                    tabline = {},
                    winbar = {},
                    inactive_winbar = {},
                    extensions = {}
                }
            end
        },
        {
            "mason-org/mason.nvim",
            config = function()
                require("mason").setup()
            end
        },
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
            config = function()
                local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

                local default_setup = function(server)
                    require("lspconfig")[server].setup({
                        capabilities = lsp_capabilities
                    })
                end

                require("mason-lspconfig").setup({
                    handlers = {
                        default_setup
                    }
                })
            end
        },
        {
            "hrsh7th/nvim-cmp",
            config = function()
                local cmp = require("cmp")
                cmp.setup {
                    sources = {
                        { name = "nvim_lsp" }
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            else
                                fallback()
                            end
                        end, { "i", "s" })
                    })
                }

            end
        },
        {
            "lewis6991/gitsigns.nvim",
            lazy = true, -- fix
            config = function ()
                require('gitsigns').setup {
                    signs = {
                        add          = { text = '+' },
                        change       = { text = '+' },
                        delete       = { text = '-' },
                        topdelete    = { text = '‾' },
                        changedelete = { text = '~' },
                        untracked    = { text = '┆' },
                    },
                    signs_staged_enable = true,
                    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                    watch_gitdir = {
                        follow_files = true
                    },
                    auto_attach = true,
                    attach_to_untracked = false,
                    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 1000,
                        ignore_whitespace = false,
                        virt_text_priority = 100,
                        use_focus = true,
                    },
                    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
                    sign_priority = 6,
                    update_debounce = 100,
                    status_formatter = nil, -- Use default
                    max_file_length = 40000, -- Disable if file is longer than this (in lines)
                    preview_config = {
                        -- Options passed to nvim_open_win
                        border = 'single',
                        style = 'minimal',
                        relative = 'cursor',
                        row = 0,
                        col = 1
                    },
                }
            end
        },
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-treesitter/nvim-treesitter",
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
