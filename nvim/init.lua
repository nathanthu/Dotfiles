vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
        local repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
        {
                "NvChad/NvChad",
                lazy = false,
                branch = "v2.5",
                import = "nvchad.plugins",
        },

        { import = "plugins" },
}, lazy_config)

-- Fix the top/bottom padding:
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then return end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function() io.write("\027]111\027\\") end,
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- warning: commented because it does a glitch where it gives focus to the notification and breaks my flow:
--
-- enable the new ui2, in pcall because it will probably get it's name changed from _core to core
-- pcall(function()
-- 	require("vim._core.ui2").enable { enable = true }
-- end)

require "options"
require "nvchad.autocmds"
-- requiring my own little add-ons
-- require("discipline").cowboy() -- based on craftzdog, hjkl bw are limited
require("macroNotify").setup() -- notify when recording macros

vim.schedule(function()
        require "mappings"
end)
