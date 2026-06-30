-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "flexoki",
	integrations = { "render-markdown" },
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = {
	load_on_startup = true,

	-- header = {
	-- 	"⠀⠀⠀⣢⣿⣿⣿⠃⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠈⠊⡄⠀⠀⢡⡇⠀⠀⠀⠀⠀⠀⠈⠀⣶⣦⠀⠀⠀⠀⢹⣿⣿⣿⣷⡈⢀⠜⠀",
	-- 	"⠀⠀⢠⣾⣿⡿⡏⠰⠁⠀⢀⠄⠀⠀⠀⢠⡾⠀⠀⠀⠀⠀⠈⠀⠀⠈⠀⠀⢀⠀⠀⠀⢠⡀⢀⢹⣿⣧⠘⡆⡆⢸⣿⣿⣿⣿⢃⠔⠊⠀",
	-- 	"⠀⠀⠈⣿⣿⡇⢳⢀⠄⣠⠇⠀⠀⣰⢀⣿⠁⠀⠀⣠⡞⢀⠆⣰⠀⠀⢀⠀⣸⠀⣶⢀⣿⣧⠈⣎⣿⣿⠄⠀⣿⢸⢿⣿⣿⣏⠀⠄⠂⠀",
	-- 	"⠀⠀⠀⠸⠿⠗⠈⢾⠀⣟⡇⠀⠠⣽⢸⡇⠀⢀⢠⣿⠁⢃⣼⢃⡀⠀⡏⢸⣿⠀⠀⣼⣿⣿⠀⢸⣿⣿⠁⣸⣿⣿⢸⣿⣿⡇⠈⠔⠀⠀",
	-- 	"⡅⠀⢠⣥⣷⣶⣿⣿⡔⣿⠇⢀⡄⠸⡘⡇⠀⢀⣾⠛⠀⢘⣵⣿⡀⠘⢀⣿⣿⠀⢠⣿⣿⣿⠀⣸⣿⡏⣠⣿⣿⣿⣷⣾⣿⣷⣶⡄⠀⡇",
	-- 	"⢡⠀⣾⣧⡙⠿⣿⣿⣿⣿⡆⢰⣷⣶⣙⠄⣸⣼⣿⡇⢠⣺⣿⣿⡇⠀⢸⣿⠟⠀⢸⡿⣛⡟⢠⣿⣿⣿⣿⣿⣿⣿⡿⠟⣻⣿⣿⣷⢸⠁",
	-- 	"⢸⡄⣿⣿⣷⣄⠀⠈⠙⢿⣷⠸⣿⣿⣿⣆⢣⣿⣿⣿⠀⢺⣿⣿⣷⠀⡟⢣⣾⠀⣿⣾⣿⣣⣾⡟⣿⣿⣿⠿⠛⠁⢀⣴⣿⣿⣿⣯⣾⡆",
	-- 	"⢰⢻⣿⣿⣿⣿⣷⣦⣀⠀⠈⠑⠙⠿⣿⣿⣧⣿⣿⣿⣿⡎⣿⣿⣿⡆⢧⣾⣿⣇⣾⡿⠿⠛⠁⠀⠁⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⠆",
	-- 	"⢠⣹⣿⣿⣿⣿⣿⣎⠻⡿⢶⣤⡄⣀⠀⠀⠀⠀⠙⠻⠟⠁⣟⣿⣿⠀⠼⠛⠟⠋⠁⠀⠀⠀⠀⣀⢀⣠⣠⡤⢀⣾⣿⣿⣿⣿⣿⣿⢷⠂",
	-- 	"⠀⢿⣻⣿⣿⣿⣿⣿⣥⣆⢍⢉⣉⣉⣁⠀⠀⠀⠀⢀⡠⠀⠸⢿⣧⢂⠀⠀⠀⠀⠀⠀⠺⠿⠷⠶⢚⡛⠋⣡⣾⣿⣿⣿⣿⣿⣿⣣⡏⠀",
	-- 	"⠀⠈⠃⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⣶⣯⣤⣀⣲⠀⠀⢸⣯⣥⣷⣶⣶⣾⣿⣿⣿⣯⣤⣶⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⡏⢛⡤⠀",
	-- 	"⠀⠀⣷⢸⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⡶⣄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣏⠀",
	-- 	"⠀⠀⢹⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣾⣏⡞⠀",
	-- 	"                                                  ",
	-- 	"                                                  ",
	-- },
	--    buttons = {}
	--
	header = { "" },
	buttons = {
		{ txt = "To realize that all your life - you know, all your love, all your hate, all your", no_gap = true },
		{ txt = " memories, all your pain - it was all the same thing. It was all the same dream,", no_gap = true },
		{ txt = "    a dream that you had inside a locked room, a dream about being a person.", no_gap = true },
	},
}

M.term = {
	sizes = { vsp = 0.4 },
	-- float = {
	--     row = 0.25, col = 0.2,
	--     width = 0.6, height = 0.5,
	-- }
}

M.ui = {
	telescope = { style = "bordered" },
	-- statusline = {
	-- 	theme = "minimal",
	-- 	separator_style = "default",
	-- 	order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
	-- 	modules = {},
	-- },
}

M.cheatsheet = {
	theme = "simple",
}

return M
