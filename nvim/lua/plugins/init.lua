local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Ruby & Rails
  { "slim-template/vim-slim" },
  { "tpope/vim-bundler" },
  { "tpope/vim-rails" },
  { "thoughtbot/vim-rspec" },
  { "tpope/vim-rake" },
  { "vim-ruby/vim-ruby" },
  { "ngmy/vim-rubocop" },
  { "ThanhKhoaIT/rails-db-migrate.vim" },
  { "kana/vim-textobj-user" },
  { "tpope/vim-cucumber" },
  { "tpope/vim-eunuch" },
  { "honza/vim-snippets" },
  { "janko-m/vim-test" },
  { "pbrisbin/vim-mkdir" },
  { "tpope/vim-repeat" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-surround" },
  { "tpope/vim-dispatch" },
  { "907th/vim-auto-save" },
  { "diepsohung/vim-move" },
  { "Yggdroot/indentLine" },
  { "ntpeters/vim-better-whitespace" },
  { "mg979/vim-visual-multi", branch = "master" },
  { "rking/ag.vim" },
  { "easymotion/vim-easymotion" },
  { "junegunn/gv.vim" },
  { "Exafunction/codeium.vim", branch = "main" },

  -- Tmux Navigator
  { "christoomey/vim-tmux-navigator" },

  -- Git Integration
  { "tpope/vim-fugitive" },

  -- Code Commenting
  { "vim-scripts/tComment" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "ruby", "solidity", "lua", "python", "javascript", "html", "css", "tsx", "typescript", "c", "vim", "vimdoc", "query", "elixir" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup({
        options = {
          icons_enabled = true,          -- Enable icons in the statusline
          theme = "auto",                -- Theme for the statusline, "auto" selects a theme based on current colorscheme
          section_separators = "",       -- No section separators
          component_separators = "",     -- No component separators
          disabled_filetypes = {         -- Disable lualine in certain filetypes
            statusline = {},
            winbar = {},
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },                        -- Shows current mode (e.g., NORMAL, INSERT)
          lualine_b = { "branch", "diff", "diagnostics" }, -- Shows branch, diffs, and diagnostics
          lualine_c = { "filename" },                    -- Shows the current file name
          lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, format (e.g., UNIX), and file type
          lualine_y = { "progress" },                    -- Shows progress (e.g., line percentage)
          lualine_z = { "location" }                     -- Shows line and column location
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
    config = function()
      require("nvim-tree").setup({
        -- custom configuration options for nvim-tree
        view = { width = 30, side = "left", },
        renderer = {
          icons = {
            show = { git = true, folder = true, file = true, folder_arrow = true, },
          },
        },
        actions = {
          open_file = { quit_on_open = true, },
        },
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        winopts = {
          height = 0.9,   -- 80% of the total height
          width = 0.9,    -- 90% of the total width
          row = 0.1,      -- Centered 10% from the top
          col = 0.05,     -- Centered 5% from the left
          preview = {
            hidden = "nohidden",  -- Show preview by default
          },
        },
      })
    end
  },
  { "tomasiser/vim-code-dark" },
  { "neovim/nvim-lspconfig" },
})

vim.cmd("colorscheme codedark")
