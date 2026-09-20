-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                              K E Y M A P S                               ║
-- ╠══════════════════════════════════════════════════════════════════════════╣
-- ║  NvChad's own mappings load first (see nvchad/lua/nvchad/mappings.lua).  ║
-- ║  Everything below either adds to them or deliberately overrides them.    ║
-- ║                                                                          ║
-- ║  Every mapping carries a `desc` — which-key reads it, and so does        ║
-- ║  `:verbose nmap <key>` when you're wondering where something came from.  ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

require "nvchad.mappings"

local map = vim.keymap.set

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  MOTION                                                                  │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Bare j/k walk display lines (nice in wrapped prose); with a count they walk
-- real lines, so 5j still agrees with the relative number in the gutter.
map({ "n", "v" }, "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (display line)" })

map({ "n", "v" }, "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (display line)" })

map("n", "<leader>n", function()
	local on = vim.wo.number or vim.wo.relativenumber
	vim.wo.number = not on
	vim.wo.relativenumber = not on
end, { silent = true, desc = "Toggle line numbers" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  KEEP THE CURSOR CENTERED                                                │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Half page down + center" })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Half page up + center" })
map("n", "n", "nzz", { silent = true, desc = "Next match + center" })
map("n", "N", "Nzz", { silent = true, desc = "Previous match + center" })
map("n", "G", "Gzz", { silent = true, desc = "End of file + center" })
map("n", "(", "(zz", { silent = true, desc = "Previous sentence + center" })
map("n", ")", ")zz", { silent = true, desc = "Next sentence + center" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  MOVING LINES                                                            │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  WINDOWS  —  arrow keys are repurposed rather than disabled              │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Vertical arrows resize the current window horizontally. <C-w>< and <C-w>>
-- are relative to the current window, not the screen, so left/right arrows
-- would point the wrong way half the time depending on which split you're in.
map("n", "<Up>", "10<C-w>>", { silent = true, desc = "Grow window width" })
map("n", "<Down>", "10<C-w><", { silent = true, desc = "Shrink window width" })

map("n", "<Left>", "<Nop>", { silent = true, desc = "Disabled — use hjkl" })
map("n", "<Right>", "<Nop>", { silent = true, desc = "Disabled — use hjkl" })

-- Arrows stay dead everywhere else, to keep hjkl muscle memory honest.
for _, key in ipairs { "<Up>", "<Down>", "<Left>", "<Right>" } do
	map({ "v", "i" }, key, "<Nop>", { silent = true, desc = "Disabled — use hjkl" })
end


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  COPILOT                                                                 │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>co", "<cmd>CopilotChat<CR>", { silent = true, desc = "Copilot: open chat" })
map("n", "<leader>cs", "<cmd>Copilot status<CR>", { silent = true, desc = "Copilot: status" })
map("n", "<leader>ce", "<cmd>Copilot enable<CR>", { silent = true, desc = "Copilot: enable" })
map("n", "<leader>cd", "<cmd>Copilot disable<CR>", { silent = true, desc = "Copilot: disable" })

-- <Tab> is left alone (vim.g.copilot_no_tab_map in options.lua); accept here.
map("i", "<C-y>", 'copilot#Accept("<CR>")', {
	expr = true,
	silent = true,
	replace_keycodes = false,
	desc = "Copilot: accept suggestion",
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  SEARCH  —  NvChad already binds <leader>ff, <leader>fw, <leader>fb      │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Grep in project" })
map("n", "<leader>fd", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true, desc = "Find in buffer" })
map("n", "<leader>jj", "<cmd>Telescope jumplist<CR>", { silent = true, desc = "Jumplist" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  REGISTERS                                                               │
-- └──────────────────────────────────────────────────────────────────────────┘

-- "0 is the yank register: survives an intervening delete, unlike "".
map({ "n", "v" }, "<leader>p", '"0p', { silent = true, desc = "Paste last yank" })
map("n", "<leader>re", "<cmd>registers<CR>", { silent = true, desc = "Show registers" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  TERMINAL                                                                │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<A-v>", function()
	require("nvchad.term").new { pos = "vsp" }
end, { desc = "Terminal: new vertical" })

map("n", "<leader>to", function()
	require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal: toggle vertical" })

map("t", "<ESC>", "<C-\\><C-N>", { desc = "Terminal: leave insert mode" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │  MACROS                                                                  │
-- └──────────────────────────────────────────────────────────────────────────┘

-- q closes the terminal when you're in one, and otherwise behaves exactly like
-- stock q. Two things here are load-bearing:
--
--   * Returning "q" hands the key back to Neovim, so recording both starts and
--     stops. Don't swap this for getcharstr() — that blocks on a second key,
--     which then executes as a normal-mode command.
--   * The toggle is wrapped in vim.schedule because expr mappings evaluate
--     under textlock, where closing a window raises E565.
map("n", "q", function()
	if vim.bo.buftype == "terminal" then
		vim.schedule(function()
			require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
		end)
		return ""
	end
	return "q"
end, { expr = true, desc = "Record macro (or close terminal)" })
