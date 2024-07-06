local uv, fn = vim.uv, vim.fn
local pack = {}
pack.__index = pack

function pack:load_modules_packages()
    ---@diagnostic disable-next-line: param-type-mismatch
    local modules_dir = vim.fs.joinpath(self.config_path, "lua", "opa-oz", "modules")
    self.repos = {}

    local list = vim.fs.find("package.lua", { path = modules_dir, type = "file", limit = 10 })
    if #list == 0 then
        return
    end

    vim.iter(list):map(function(f)
        local _, pos = string.find(f, modules_dir, 0, true) -- `true` is required because there is "/" and "." in path
        f = "opa-oz." .. f:sub(pos - 6, #f - 4):gsub("/", ".")
        require(f)
    end)
end

function pack:boot_strap()
    self.data_path = fn.stdpath("data")
    self.config_path = fn.stdpath("config")

    local lazypath = vim.fs.joinpath(self.data_path, "lazy", "lazy.nvim")
    if not (uv or vim.loop).fs_stat(lazypath) then
        fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    self:load_modules_packages()
    require("lazy").setup(self.repos)
end

_G.packageadd = function(package)
    if not pack.repos then
        pack.repos = {}
    end

    pack.repos[#pack.repos + 1] = package
end

return pack
