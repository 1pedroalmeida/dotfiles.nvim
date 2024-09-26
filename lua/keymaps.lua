local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<leader>ff", telescope.find_files)
    map("n", "<leader>fg", telescope.live_grep)
    map("n", "<leader>fb", telescope.buffers)
    map("n", "<leader>fh", telescope.help_tags)
    map("n", "<leader>fs", telescope.git_status)
    map("n", "<leader>fc", telescope.git_commits)
else
    print("Telescope not found")
end

-- buffers
map("n", "<leader>x", ":close<CR>")

-- terminal
map("n", "<leader>.", ":sp term://powershell.exe -nologo<CR>")

-- window navigation
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprev<CR>")
map("n", "<Left>", "<C-w>h")
map("n", "<Right>", "<C-w>l")
map("n", "<Up>", "<C-w>k")
map("n", "<Down>", "<C-w>j")

-- netrw
map("n", "<C-n>", function ()
    vim.g.netrw_browse_split = 0
    vim.cmd("20Ex")
end)

map("n", "<S-n>", function ()
    vim.g.netrw_browse_split = 4
    vim.cmd("20Vex")
end)

map("n", "<leader>n", function ()
    vim.g.netrw_browse_split = 0
    vim.cmd("Vex!")
end)
-- map("n", "<C-n>", ":20Ex<CR>")
-- map("n", "<S-n>", ":20Vex<CR>")

vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
        end

        -- edit new file
        bind('a', '%')

        -- rename file
        bind('r', 'R')

        -- delete file
        -- bind('dd', '<del>')

        -- make a directory
        -- bind('D', 'd')
    end
})

-- notes
map("n", "<leader>o", ":Vex! c:/users/prvma/documents/Notes<CR>")
