return {
  {
    -- Plugin: nvim-tmux-navigation
    -- URL: https://github.com/alexghergh/nvim-tmux-navigation
    -- Description: A Neovim plugin that allows seamless navigation between Neovim and tmux panes.
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
      })
    end,
  },
}
