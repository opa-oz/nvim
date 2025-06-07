local filetype = vim.filetype
local api = vim.api
local bo = vim.bo

if filetype then
    filetype.add({
        pattern = {
            [".*/openwrt/dhcp"] = "uci",
            [".*/openwrt/dropbear"] = "uci",
            [".*/openwrt/firewall"] = "uci",
            [".*/openwrt/network"] = "uci",
            [".*/openwrt/rpcd"] = "uci",
            [".*/openwrt/system"] = "uci",
            [".*/openwrt/ucitrack"] = "uci",
            [".*/openwrt/uhttpd"] = "uci",
            [".*/openwrt/luci"] = "uci",
            [".*/*.uci"] = "uci",
        },
    })
else
    api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
            "*/openwrt/dhcp",
            "*/openwrt/dropbear",
            "*/openwrt/firewall",
            "*/openwrt/network",
            "*/openwrt/rpcd",
            "*/openwrt/system",
            "*/openwrt/ucitrack",
            "*/openwrt/uhttpd",
            "*/openwrt/luci",
            "*.uci",
        },
        callback = function()
            bo.filetype = "uci"
        end,
    })
end
