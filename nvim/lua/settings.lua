vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamed"
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 20
vim.opt.tabstop = 2          -- Softtabs, 2 spaces
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

vim.opt.tags:append(".git/tags")
vim.opt.tags = "tags"

-- Open new split panes to the right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Display special characters for whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }

-- Set the location of the custom spellfile
vim.opt.spellfile = os.getenv("HOME") .. "/.vim-spell-en.utf-8.add"

-- Autocomplete with dictionary words when spell check is on
vim.opt.complete:append("kspell")

-- Always use vertical diffs
vim.opt.diffopt:remove("internal")
vim.opt.diffopt:append("vertical")

-- Use one space after punctuation, not two
vim.opt.joinspaces = false

-- Configure backspace behavior and disable backup/swap files
vim.opt.backspace = "2"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Set history, ruler, and status line display
vim.opt.history = 50
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.incsearch = true

vim.opt.laststatus = 2
vim.opt.autowrite = true

-- Security settings for modelines
vim.opt.modelines = 0
vim.opt.modeline = false

-- Disable compatibility mode for full Neovim features
vim.opt.compatible = false

