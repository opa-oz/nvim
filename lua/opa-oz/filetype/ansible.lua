-- NOTE: https://github.com/mfussenegger/nvim-ansible/tree/main
local filetype = vim.filetype
local api = vim.api
local bo = vim.bo

if filetype then
    filetype.add({
        pattern = {
            [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
            [".*/playbook.*%.ya?ml"] = "yaml.ansible",
            [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
            [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
        },
    })
else
    api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
            "*/host_vars/*.yml",
            "*/host_vars/*.yaml",
            "*/group_vars/*.yml",
            "*/group_vars/*.yaml",
            "*/group_vars/*/*.yml",
            "*/group_vars/*/*.yaml",
            "*/playbook*.yml",
            "*/playbook*.yaml",
            "*/playbooks/*.yml",
            "*/playbooks/*.yaml",
            "*/roles/*/tasks/*.yml",
            "*/roles/*/tasks/*.yaml",
            "*/roles/*/handlers/*.yml",
            "*/roles/*/handlers/*.yaml",
            "*/tasks/*.yml",
            "*/tasks/*.yaml",
            "*/molecule/*.yml",
            "*/molecule/*.yaml",
        },
        callback = function()
            bo.filetype = "yaml.ansible"
        end,
    })
end

if vim.fn.executable("ansible-doc") then
    bo.keywordprg = ":sp term://ansible-doc"
end
local fname = api.nvim_buf_get_name(0)
if fname:find("tasks/") then
    local paths = {
        bo.path,
        vim.fs.dirname(fname:gsub("tasks/", "files/")),
        vim.fs.dirname(fname:gsub("tasks/", "templates/")),
        vim.fs.dirname(fname),
    }
    bo.path = table.concat(paths, ",")
end

bo.iskeyword = "@,48-57,_,192-255,."
