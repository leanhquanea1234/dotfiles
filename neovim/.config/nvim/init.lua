-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

local opts = {
	change_detection = {
		-- Don't notify us every time a change is made to the configuration
		notify = false,
	},
	checker = {
		-- Automatically check for package updates
		enabled = true,
		-- Don't spam us with notification every time there is an update available
		notify = false,
	},
}
-- CLIPBOARD
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard for yank/paste

-- Fallback to xclip/xsel if wl-copy is not available
if vim.fn.executable('wl-copy') == 1 then
  vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
      ["+"] = 'wl-copy --foreground --type text/plain',
      ["*"] = 'wl-copy --foreground --primary --type text/plain',
    },
    paste = {
      ["+"] = 'wl-paste --no-newline',
      ["*"] = 'wl-paste --no-newline --primary',
    },
    cache_enabled = true,
  }
elseif vim.fn.executable('xclip') == 1 then
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ["+"] = 'xclip -selection clipboard',
      ["*"] = 'xclip -selection primary',
    },
    paste = {
      ["+"] = 'xclip -selection clipboard -o',
      ["*"] = 'xclip -selection primary -o',
    },
    cache_enabled = true,
  }
end

require("config.options") -- load /config/options.lua
require("config.keymaps")
-- Load the auto commands from the config/autocmds.lua file
require("config.autocmds")

-- Setup lazy, this should always be last
-- Tell lazy that all plugin specs are found in the plugins directory
-- Pass it the options we specified above
require("lazy").setup("plugins", opts)
