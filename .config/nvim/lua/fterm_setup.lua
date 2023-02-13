local ok, fterm = pcall(require, "FTerm")
local ok_m, m = pcall(require, "mapx")

local ready = ok and ok_m

if not ready then
    do
        return
    end
end

m.cmd("FtermToggle", fterm.toggle)
vim.keymap.set("n", "`", "<CMD>FtermToggle<CR>")
vim.keymap.set("t", "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
