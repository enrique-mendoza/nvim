-- Instal with: go install github.com/docker/docker-language-server/cmd/docker-language-server@latest

---@type vim.lsp.Config
return {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile", "yaml.docker-compose" },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
    },
  },
}
