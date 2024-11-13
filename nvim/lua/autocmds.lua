function rename_file()
  local old_name = vim.fn.expand("%:p")  -- Get the full path of the current file
  vim.ui.input({ prompt = "New file name: ", default = old_name }, function(new_name)
    if new_name and new_name ~= "" and new_name ~= old_name then
      vim.cmd("saveas " .. vim.fn.fnameescape(new_name))  -- Save file as new name
      vim.fn.delete(old_name)  -- Delete the old file
      vim.cmd("redraw!")  -- Refresh the buffer display
    end
  end)
end

-- Map the function to <Leader>rnf
vim.api.nvim_set_keymap("n", "<Leader>rnf", ":lua rename_file()<CR>", { noremap = true, silent = true })

function trim_end_lines()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[silent! %s/\($\n\s*\)\+\%$//e]])
  vim.fn.setpos(".", save_cursor)
end

-- Auto command to call TrimEndLines before saving *.rb files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rb",
  callback = trim_end_lines,
})


local fzf = require("fzf-lua")
vim.api.nvim_create_user_command("RGrails", function(opts)
  fzf.grep({
    search = opts.args,
    rg_opts = "--column --line-number --no-heading --color=always --smart-case -g '!p2p-frontend' -g '*.{rb,erb,vue,js,es6,css,sass,scss,yml,rake,haml}'",
    previewer = "bat",
  })
end, { nargs = "*" })

vim.api.nvim_create_user_command("RGall", function(opts)
  fzf.grep({
    search = opts.args,
    rg_opts = "--column --line-number --no-heading --color=always --smart-case -g '!p2p-frontend/public/assets/chunks' -g '*.{rb,erb,vue,js,es6,css,sass,scss,yml,rake,haml,feature}'",
    previewer = "bat",
  })
end, { nargs = "*" })

-- Import the lspconfig module
-- local lspconfig = require("lspconfig")
--
-- -- Configure the Solargraph language server
-- lspconfig.solargraph.setup({
--   settings = {
--     solargraph = {
--       diagnostics = true,    -- Enable diagnostics
--       formatting = true,     -- Enable formatting
--       completion = true,     -- Enable completion
--     },
--   },
-- })

local group = vim.api.nvim_create_augroup("RubyEx", { clear = true })
local initialized_ruby_syntax = false
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "ruby", "eruby" },
  callback = function()
    if not initialized_ruby_syntax then
      vim.cmd([[TSDisable highlight]])
      vim.cmd([[TSEnable highlight]])

      initialized_ruby_syntax = true
    end
  end,
})
