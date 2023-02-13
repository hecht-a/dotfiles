vim.g.mapleader = " "

vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.wrap = true
vim.opt.listchars:append("eol:↴")
-- vim.opt.winbar = "%f %m"

require('plugins')

local ok_catppuccin, catppuccin = pcall(require, "catppuccin")
if ok_catppuccin then
	catppuccin.setup({ transparent_background = true })
	vim.cmd("colorscheme catppuccin")
	vim.g.catppuccinflavour = "mocha"
end

local ok_m, m = pcall(require, "mapx")

if ok_m then
    m.noremap("<up>", "<nop>", "silent")
    m.noremap("<down>", "<nop>", "silent")
    m.noremap("<left>", "<nop>", "silent")
    m.noremap("<right>", "<nop>", "silent")

    m.noremap("<leader>w", ":w<CR>", "silent")
    m.noremap("<leader>q", ":q<CR>", "silent")

    -- -- tab navigation
    m.noremap("<S-H>", ":tabprev<CR>", "silent")
    m.noremap("<S-L>", ":tabnext<CR>", "silent")
    m.noremap("<leader>TT", ":tabnew<CR>", "silent")
    m.noremap("<leader>TC", ":tabclose<CR>", "silent")

    -- -- window navigatio
    m.nnoremap("<C-J>", "<C-w><C-j>")
    m.nnoremap("<C-K>", "<C-w><C-k>")
    m.nnoremap("<C-H>", "<C-w><C-h>")
    m.nnoremap("<C-L>", "<C-w><C-l>")

    -- -- lazygit
    m.nnoremap("<leader>gg", ":LazyGit<CR>", "silent")
end
