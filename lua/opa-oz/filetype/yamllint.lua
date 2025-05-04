local filetype = vim.filetype
local api = vim.api
local bo = vim.bo

if filetype then
    filetype.add({
        pattern = {
            [".yamllint"] = "yaml",
            ["*.yamllint"] = "yaml",
        },
    })
else
    api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
            "*.yamllint",
            ".yamllint",
        },
        callback = function()
            bo.filetype = "yaml"
        end,
    })
end
