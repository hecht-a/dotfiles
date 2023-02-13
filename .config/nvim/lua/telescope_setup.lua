local ok_m, m = pcall(require, "mapx")
local ok_telescope, telescope = pcall(require, "telescope")

local ready = ok_m and ok_telescope

if not ready then
    do
        return
    end
end

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    pickers = {
        find_files = {
            find_command = {
                "fd",
                "--type",
                "f",
                "-H",
                "-E",
                "node_modules",
                "-E",
                ".git",
                "-E",
                ".env*",
                "-I",
            },
        },
    },
    extensions = {
        file_browser = {
            hidden = false,
            respect_gitignore = true,
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<A-t>"] = fb_actions.change_cwd,
                    ["<C-t>"] = actions.select_tab,
                },
            },
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("neoclip")

m.noremap("<leader>fd", ":Telescope file_browser<CR>")
m.noremap("<leader>fb", ":Telescope file_browser path=%:p:h<CR>", "silent")
m.noremap("<leader>ff", ":Telescope find_files<CR>", "silent")
m.noremap("<leader>fg", ":Telescope live_grep<CR>", "silent")
m.noremap("<leader>pp", ":Telescope project<CR>", "silent")
m.noremap("<leader>nc", ":Telescope neoclip<CR>", "silent")
