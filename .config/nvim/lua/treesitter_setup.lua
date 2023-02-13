local ok, configs = pcall(require, "nvim-treesitter.configs")

if ok then
    configs.setup({
        additional_vim_regex_highlighting = false,
        enable = true,
        ensure_installed = {
            "astro",
            "bash",
            "cpp",
            "c",
            "css",
            "dockerfile",
            "graphql",
            "go",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "markdown",
            "php",
            "python",
            "ruby",
            "rust",
            "scss",
            "sql",
            "svelte",
            "toml",
            "tsx",
            "yaml",
            "typescript",
        },
        ignore_install = { "phpdoc" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    })
end
