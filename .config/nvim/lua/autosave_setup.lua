local ok, autosave = pcall(require, "auto-save")

if not ok then
    do
        return
    end
end

autosave.setup({
    enabled = false,
    execution_message = {
        message = function()
            return ""
        end,
    },
    trigger_events = { "TextChangedI" },
})
