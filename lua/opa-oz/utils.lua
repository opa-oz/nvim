local uv = vim.loop
local utils = {}

utils.is_win = uv.os_uname().version:match("Windows")

function utils.path_join(...)
    local path_sep = utils.is_win and "\\" or "/"
    return table.concat({ ... }, path_sep)
end

return utils
