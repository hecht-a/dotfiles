local ok, formatter = pcall(require, "formatter")

if not ok then
    do
        return
    end
end

formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        css = {
            require("formatter.filetypes.css").prettier,
        },
        svelte = {
            require("formatter.filetypes.svelte"),
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier,
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier,
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier,
        },
        json = {
            require("formatter.filetypes.json").prettier,
        },
        lua = {
            require("formatter.filetypes.lua").luaformat,
            require("formatter.filetypes.lua").stylua,
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier,
        },
    },
})
