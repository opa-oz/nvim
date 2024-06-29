local workspaces = require("workspaces")
local uv = vim.loop
local utils = require("opa-oz.utils")
local wspc = workspaces.get()
local path = utils.path_join(vim.fn.stdpath("cache"), "dashboard", "cache")

local projects = {}
for _, folder in pairs(wspc or {}) do
    local p = folder.path

    if p:sub(#p, #p) == "/" then
        p = p:sub(1, -2)
    end

    if not vim.tbl_contains(projects, p) then
        table.insert(projects, p)
    end
end

table.sort(projects)

uv.fs_open(path, "r+", 384, function(err, fd)
    assert(not err, err)
    local dump = "return " .. vim.inspect(projects)
    uv.fs_write(fd, dump, 0, function(err, _)
        assert(not err, err)
        uv.fs_ftruncate(fd, #dump, function(err, _)
            assert(not err, err)
            uv.fs_close(fd)
        end)
    end)
end)
