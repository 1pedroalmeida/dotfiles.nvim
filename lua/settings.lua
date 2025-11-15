local g = vim.g;
local o = vim.o;

vim.scriptencoding = "utf-8"

g.mapleader = " "
g.maplocalleader = " "
g.netrw_keepdir = 0
g.netrw_banner = 0
g.netrw_winsize = 37
g.netrw_browse_split = 0

o.wrap = true
o.ignorecase = true
o.smartcase = true
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 4
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.title = true
o.termguicolors = true
o.splitright = true
o.splitbelow = true
o.shadafile = "NONE"
o.signcolumn = "yes"

-- Apontamentos uni
--
local group = vim.api.nvim_create_augroup("ApFilesCmd", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  pattern = "*.ap",
  callback = function()
    vim.cmd("hi customYellow guifg=DarkYellow")
    vim.cmd("syn match customYellow /\\[\\zs[^\\]]\\+\\ze\\]/")
    vim.cmd("hi customOrange guifg=DarkOrange gui=bold")
    vim.cmd("syn match customOrange /Σ/")
    vim.cmd("hi customGrey guifg=Grey gui=bold")
    vim.cmd("syn match customGrey /[⊆∈∩∪]/")
  end,
})
