local filetype = vim.filetype
local api = vim.api
local bo = vim.bo

if filetype then
    filetype.add({
        pattern = {
            [".*/openwrt/dhcp"] = "uci",
            [".*/openwrt/firewall"] = "uci",
        },
    })
else
    api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
            "*/openwrt/dhcp",
            "*/openwrt/firewall",
        },
        callback = function()
            bo.filetype = "uci"
        end,
    })
end
