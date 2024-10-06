require "user.launch"

-- user config
require "user.core.autocmds"
require "user.core.keymaps"
require "user.core.options"

-- plugins
spec "user.plugins.alpha"
spec "user.plugins.autopairs"
spec "user.plugins.autosession"
spec "user.plugins.autotag"
spec "user.plugins.bigfile"
spec "user.plugins.breadcrumbs"
spec "user.plugins.bookmark"
spec "user.plugins.bufdelete"
spec "user.plugins.bqf"
spec "user.plugins.cellular-automaton"
spec "user.plugins.comment"
spec "user.plugins.colorizer"
spec "user.plugins.colorscheme"
spec "user.plugins.cmp"
spec "user.plugins.dap"
spec "user.plugins.devicons"
spec "user.plugins.dial"
spec "user.plugins.diffview"
spec "user.plugins.dressing"
spec "user.plugins.drop"
spec "user.plugins.eyeliner"
spec "user.plugins.fidget"
spec "user.plugins.fugit2"
spec "user.plugins.fugitive"
spec "user.plugins.gitlinker"
spec "user.plugins.gitsigns"
spec "user.plugins.gopher"
spec "user.plugins.harpoon"
spec "user.plugins.identline"
spec "user.plugins.illuminate"
spec "user.plugins.jaq"
spec "user.plugins.lab"
spec "user.plugins.lazydev"
spec "user.plugins.lspconfig"
spec "user.plugins.lualine"
spec "user.plugins.luarocks"
spec "user.plugins.mason"
spec "user.plugins.matchup"
spec "user.plugins.media-files"
spec "user.plugins.miniicons"
spec "user.plugins.modificator"
spec "user.plugins.navbuddy"
spec "user.plugins.navic"
spec "user.plugins.neogit"
spec "user.plugins.neoscroll"
spec "user.plugins.neotab"
spec "user.plugins.neotest"
spec "user.plugins.netrw"
spec "user.plugins.no-neck-pain"
spec "user.plugins.nui"
spec "user.plugins.null-ls"
spec "user.plugins.numb"
spec "user.plugins.nvim-notes"
spec "user.plugins.nvimtree"
spec "user.plugins.oil"
spec "user.plugins.package-info"
spec "user.plugins.persistence"
spec "user.plugins.project"
spec "user.plugins.render-markdown"
spec "user.plugins.rustacean"
spec "user.plugins.schemastore"
spec "user.plugins.screenkey"
spec "user.plugins.sleuth"
spec "user.plugins.spider"
spec "user.plugins.surround"
spec "user.plugins.tabby"
spec "user.plugins.telescope"
spec "user.plugins.telescope-tabs"
spec "user.plugins.todo-comments"
spec "user.plugins.toggleterm"
spec "user.plugins.treesitter"
spec "user.plugins.trouble"
spec "user.plugins.tsc"
spec "user.plugins.typescript-tools"
spec "user.plugins.ufo"
spec "user.plugins.various-textobjs"
spec "user.plugins.vim-kitty"
spec "user.plugins.vim-tmux-navigator"
spec "user.plugins.visual"
spec "user.plugins.whichkey"
spec "user.plugins.zen-mode"

-- plugins i don't use
-- spec "user.plugins.cmp-tabnine"
-- spec "user.plugins.copilot"
-- spec "user.plugins.devicons"
-- spec "user.plugins.gp"
-- spec "user.plugins.image"
-- spec "user.plugins.markview"
-- spec "user.plugins.minifiles"
-- spec "user.plugins.neodev"
-- spec "user.plugins.noice"
-- spec "user.plugins.notify"
-- spec "user.plugins.nvim-jdtls"
-- spec "user.plugins.session-manager"
-- spec "user.plugins.smoothie"
-- spec "user.plugins.springboot-nvim"
-- spec "user.plugins.rainbow"
-- spec "user.plugins.trailblazer"
-- spec "user.plugins.vimwiki"

-- lazy
require "user.lazy"
