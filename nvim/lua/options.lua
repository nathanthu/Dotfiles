require "nvchad.options"

-- add yours here!
vim.opt.tabstop = 4 -- number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- number of spaces to use for each step of (auto)indent
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "popup" } -- for copilot, doesn't work though...
vim.opt.cmdheight = 0 -- height of command line
vim.opt.relativenumber = false -- show relative line numbers
vim.opt.number = false

vim.opt.relativenumber = false -- show relative line numbers
vim.g.copilot_no_tab_map = true -- disable TAB to accept copilot suggestions, mapped it to C-Y
vim.g.copilot_enabled = 0 -- disable copilot by default, enable it only via :Copilot enable or mapping

-- Blinking caret in terminal
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175,t:ver25-blinkwait700-blinkoff400-blinkon250"
vim.opt.guicursor = "n-v-c:block-blinkon0,i-ci-ve:ver25-blinkon0,r-cr:hor20-blinkon0,o:hor50-blinkon0,sm:block-blinkon0,t:ver25-blinkon0"

local o = vim.o
o.clipboard = "unnamedplus"
-- o.cursorlineopt ='both' -- to enable cursorline!

o.statuscolumn = "%{% &number || &relativenumber ? '%s%=%{v:relnum?v:relnum:v:lnum}   ' : '' %}"
