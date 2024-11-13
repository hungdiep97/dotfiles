-- Set <Space> as the leader key and disable its normal mode functionality
vim.g.mapleader=" "
vim.api.nvim_set_keymap("n", "<SPACE>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", function() print "hi" end)

vim.g.auto_save = 1
-- Tmux navigator configuration
vim.g.tmux_navigator_no_mappings = 1

-- Enable better whitespace
vim.g.better_whitpace_enabled = 1

-- Set the key modifier for the move plugin
vim.g.move_key_modifier = "C"

-- Rails migrate command for vim-rails
vim.g.rails_migrate_command = "Dispatch bundle exec rake"

-- RSpec command and runner settings for vim-rspec
vim.g.rspec_command = "Dispatch bundle exec rspec {spec}"
vim.g.rspec_runner = "os_x_iterm2"

-- Multi-cursor settings
vim.g.multi_cursor_use_default_mapping = 0
vim.g.multi_cursor_start_word_key = "g<C-n>"
vim.g.multi_cursor_select_all_word_key = "g<C-a>"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_create_user_command("ForceKillRails", "!kill -9 $(cat tmp/pids/server.pid)", {})
vim.api.nvim_set_keymap("n", "<Leader>krs", ":ForceKillRails<CR>", opts)

-- GIT
map("n", "<Leader>gs", ":Gst<CR>", opts)

-- AUTO SAVE
map("n", "<Leader>as", ":AutoSaveToggle<CR>", opts)

-- Common mappings
map("n", "F", "za", opts)
map("n", "<Leader>dp", ":Dispatch ", opts)
map("n", "<Leader>f", ":Rg ", opts)

-- Rails custom search commands
map("n", "fe", ":RGjs <C-R><C-W><CR>", opts)
map("n", "fa", ":RGrails <C-R><C-W><CR>", opts)
map("n", "<Leader>fa", ":RGrails <SPACE>", opts)
map("n", "fg", ":RGall <C-R><C-W><CR>", opts)
map("n", "fm", ":RGmodel <C-R><C-W><CR>", opts)
map("n", "fv", ":RGview <C-R><C-W><CR>", opts)
map("n", "fc", ":RGcontroller <C-R><C-W><CR>", opts)
map("n", "fr", ":RGruby <C-R><C-W><CR>", opts)
map("n", "fb", ":RGblueprint <C-R><C-W><CR>", opts)
map("n", "<Leader>fe", ":RGjs ", opts)
map("n", "<Leader>fa", ":RGrails ", opts)
map("n", "<Leader>fg", ":RGall ", opts)
map("n", "<Leader>fm", ":RGmodel ", opts)
map("n", "<Leader>fv", ":RGview ", opts)
map("n", "<Leader>fc", ":RGcontroller ", opts)
map("n", "<Leader>fs", ":RGstyle ", opts)
map("n", "<Leader>fr", ":RGruby ", opts)
map("n", "<Leader>fb", ":RGblueprint ", opts)
map("n", "<Leader>-", ":RubyJump<CR>", opts)

-- Text object mappings
map("n", "c\"", "ci\"", opts)
map("n", "c'", "ci'", opts)

-- Switch between last two files
map("n", "''", "<C-^>", opts)
map("n", "<Leader>n", ":vsplit | b#<CR>", opts)

-- Arrow key reminders to use hjkl
map("n", "<Left>", ":echoe 'Use h'<CR>", opts)
map("n", "<Right>", ":echoe 'Use l'<CR>", opts)
map("n", "<Up>", ":echoe 'Use k'<CR>", opts)
map("n", "<Down>", ":echoe 'Use j'<CR>", opts)

-- Treat specific shortcuts as normal mode
map("i", "<C-b>", "<ESC><Right>bi", opts)
map("i", "<C-w>", "<ESC><Right>wi", opts)
map("i", "<C-e>", "<ESC><Right>ei", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Tmux navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
map("n", "<C-'>", ":TmuxNavigatePrevious<CR>", opts)

map("x", "<C-k>", ":move '<-2<CR>gv=gv", opts)
map("x", "<C-j>", ":move '>+1<CR>gv=gv", opts)
-- Map Ctrl + p to open fuzzy find (FZF)
map("n", "<C-p>", ":FzfLua files<CR>", opts)

-- Open config files
map("n", "<Leader>vc", ":tabedit ~/.vimrc<CR>", opts)
map("n", "<Leader>vb", ":tabedit ~/.vimrc.bundles<CR>", opts)
map("n", "<Leader>nvc", ":tabedit ~/.config/nvim/init.vim<CR>", opts)
map("n", "<Leader>nvl", ":tabedit ~/.config/nvim/init.lua<CR>", opts)

-- NeoTree
map("n", "<Leader>ntf", ":NvimTreeFindFile<CR>", opts)

-- Remove search highlights
map("n", "<Leader>uh", ":noh<CR>", opts)
map("n", "<Leader>h", ":nohlsearch<CR>", opts)

-- Save and update
map("n", "<Leader>q", ":q<CR>", opts)

-- RSpec.vim mappings
map("n", "<Leader>ta", ":call RunCurrentSpecFile()<CR>", opts)
map("n", "<Leader>tl", ":call RunNearestSpec()<CR>", opts)

-- PlugInstall (for backward compatibility if still using vim-plug)
map("n", "<Leader>vi", ":PlugInstall<CR>", opts)

-- Remove trailing whitespace
map("n", "<Leader>ws", ":StripWhitespace<CR>", opts)

-- Rails database migration mappings
map("n", "<Leader>dm", ":RailsMigrate<CR>", opts)
map("n", "<Leader>dd", ":RailsMigrateDown<CR>", opts)
map("n", "<Leader>du", ":RailsMigrateUp<CR>", opts)
map("n", "<Leader>dr", ":RailsMigrateRedo<CR>", opts)

-- Insert blank line without entering insert mode
map("n", "<Enter>", "o<ESC>", opts)

-- Zoom and unzoom panes
map("n", "Z", "<C-w>|", opts)
map("n", "zz", "<C-w>=", opts)

-- Rails-specific mappings
map("n", "<Leader>c", ":Vcontroller ", opts)
map("n", "<Leader>m", ":Vmodel ", opts)
map("n", "<Leader>v", ":Vview ", opts)
map("n", "<Leader>ve", ":Vservice ", opts)
map("n", "<Leader>vt", ":Vspec ", opts)
map("n", "<Leader>ec", ":Econtroller ", opts)
map("n", "<Leader>em", ":Emodel ", opts)
map("n", "<Leader>ev", ":Eview ", opts)
map("n", "<Leader>evt", ":Espec ", opts)

-- Debugging mappings for Ruby
map("n", "<Leader>d", "<ESC>obyebug<ESC>", opts)
map("n", "<Leader>vd", "<ESC>o- byebug<ESC>", opts)

-- Resize windows
map("n", "+", ":vertical resize +20<CR>", opts)
map("n", "_", ":vertical resize -20<CR>", opts)

-- Visual mode tab and shift-tab for indentation
map("v", "<TAB>", ">gv", opts)
map("v", "<S-TAB>", "<gv", opts)

-- EasyMotion shortcut
map("n", "<C-s>", "<Plug>(easymotion-sn)", {})

-- Vim-surround mappings
map("n", "t'", "cs\"'", opts)
map("n", "t\"", "cs'\"", opts)

-- Copy filename to clipboard
map("n", "<Leader>cfn", ":let @+ = expand('%')<CR>", opts)

-- Disable unused Shift+arrow keys
map("n", "<S-h>", "<Nop>", opts)
map("n", "<S-l>", "<Nop>", opts)
map("n", "<S-k>", "<Nop>", opts)
