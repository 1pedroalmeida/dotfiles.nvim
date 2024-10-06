<h1 align="center">Neovim config files</h1>

<p align="center">
  <img src="https://github.com/1pedroalmeida/dotfiles.nvim/blob/main/image.png" alt="image">
</p>

## Installation (Windows)
```
$ git clone https://github.com/1pedroalmeida/dotfiles.nvim $HOME\AppData\Local\nvim --depth 1
```

## Plugins

- [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## Custom keymaps

`<leader>` is set to space key

| Keymap | Mode | Description |
| ------ | ------ | ------ |
| `<C-n>` | normal | Open netrw |
| `<S-n>` | normal | Open netrw as a side bar |
| `<leader>n` | normal | Open vertical split window |
| `<Tab>` | normal | Cycle to the next buffer |
| `<S-Tab>` | normal | Cycle to the previous buffer |
| `<leader>.` | normal | Open powershell terminal on a split window |
| `<left> | H` | normal | Focus on buffer to the left |
| `<right> | L` | normal | Focus on buffer to the right |
| `<up> | K` | normal | Focus on buffer to the top |
| `<down> | J` | normal | Focus on buffer to the bottom |
| `gcc` | normal | Comment out current line |
| `gc` | visual/v-line | Comment out selected region |
| `<leader>ff` | normal | Open telescope's find_files fuzzy finder |
| `<leader>fg` | normal | Open telescope's live_grep fuzzy finder |
| `<leader>fb` | normal | Open telescope's buffers fuzzy finder |
| `<leader>fh` | normal | Open telescope's help tags |
| `<leader>fs` | normal | Open telescope's git status |
| `<leader>fc` | normal | Open telescope's git commits |
| `<leader>x` | normal | Close current buffer |
