local ok, lint = pcall(require, "lint")

if not ok then
    do
        return
    end
end



lint.linters_by_ft = {
    javascript = {'eslint'},
    javascriptreact = {'eslint'},

    typescript = {'eslint'},
    typescriptreact = {'eslint'},
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    callback = function ()
        lint.try_lint()
    end
})

