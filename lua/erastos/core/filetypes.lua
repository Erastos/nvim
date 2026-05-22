vim.filetype.add({
  filename = {
    ["site.yml"]       = "yaml.ansible",
    ["site.yaml"]      = "yaml.ansible",
    ["playbook.yml"]   = "yaml.ansible",
    ["playbook.yaml"]  = "yaml.ansible",
  },
  pattern = {
    [".*/roles/[^/]+/tasks/.*%.ya?ml"]    = "yaml.ansible",
    [".*/roles/[^/]+/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/[^/]+/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/[^/]+/vars/.*%.ya?ml"]     = "yaml.ansible",
    [".*/roles/[^/]+/meta/.*%.ya?ml"]     = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"]                = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"]             = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"]            = "yaml.ansible",
    -- Content heuristic: top-level YAML with `- hosts:` is a playbook
    [".*%.ya?ml"] = function(_, bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)
      local content = table.concat(lines, "\n")
      if content:match("%-%s+hosts:") then
        return "yaml.ansible"
      end
    end,
  },
})
