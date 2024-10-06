local M = {
  "robitx/gp.nvim",
}

function M.config()
  require("gp").setup {
    openai_api_key = "sk-proj-*",
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com/chat/completions",
        secret = {
          "bash",
          "-c",
          "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
        },
      },
    },
  }
end

return M
