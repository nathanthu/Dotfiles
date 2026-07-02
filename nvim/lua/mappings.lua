require("nvchad.mappings")


local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "Escape insert mode" }) -- map "jj" to ESC in insert mode
-- map("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "Escape insert mode" }) -- map "jj" to ESC in insert mode

map("n", "j", "gj", { noremap = true, silent = true, desc = "Move down by display line" }) -- map "j" to "gj" in normal mode
map("n", "k", "gk", { noremap = true, silent = true, desc = "Move up by display line" }) -- map "k" to "gk" in normal mode
map("v", "j", "gj", { noremap = true, silent = true, desc = "Move down by display line" }) -- map "j" to "gj" in visual mode
map("v", "k", "gk", { noremap = true, silent = true, desc = "Move up by display line" }) -- map "k" to "gk" in visual mode
map("i", "hh", "<ESC>", { noremap = true, silent = true, desc = "Escape insert mode" }) -- map "hh" to ESC in insert mode
-- map("i", "ll", "<ESC>", { noremap = true, silent = true, desc = "Escape insert mode" }) -- map "ll" to ESC in insert mode

map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center" }) -- scroll down and center
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center" }) -- scroll down and center
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true }) -- scroll up and center
map("n", "n", "nzz", { noremap = true, silent = true }) -- center when searching next
map("n", "N", "Nzz", { noremap = true, silent = true }) -- center when searching previous
map("n", "G", "Gzz", { noremap = true, silent = true }) -- center when going to the end of the file
map("n", "(", "(zz", { noremap = true, silent = true }) -- center when moving to the left
map("n", ")", ")zz", { noremap = true, silent = true }) -- center when moving to the right

map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true }) -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true }) -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- move line down(v)

map("n", "<A-w>", ":bd!<Cr>", { noremap = true, silent = true }) -- close buffer

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" }) -- Open code action

map("n", "<leader>co", ":CopilotChat<Cr>", { noremap = true, silent = true }) -- Open Copilot chat
map("n", "<leader>cs", ":Copilot status<Cr>", { noremap = true, silent = true }) -- Show Copilot status / activate
map("n", "<leader>ce", ":Copilot enable<Cr>", { noremap = true, silent = true }) -- Enable Copilot
map("n", "<leader>cd", ":Copilot disable<Cr>", { noremap = true, silent = true }) -- Disable Copilot
map("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true, replace_keycodes = false }) -- Accept Copilot suggestion

map("n", "<leader>gg", ":Telescope live_grep<Cr>", { noremap = true, silent = true }) -- Search in project with Telescope
map("n", "<leader>no", ":Telescope notify<Cr>", { noremap = true, silent = true }) -- Telescope notify history
map("n", "<leader>jj", ":Telescope jumplist<Cr>", { noremap = true, silent = true }) -- Telescope jumplist
map("n", "<leader>fd", ":Telescope current_buffer_fuzzy_find<Cr>", { noremap = true, silent = true }) -- Telescope current buffer fuzzy find

-- Remove arrow keys and echoe "USE HJKL" instead
-- normal mode
map("n", "<Up>", "10<C-w>>", { noremap = true, silent = true }) -- Instead, decrease split's size
map("n", "<Down>", "10<C-w><", { noremap = true, silent = true }) -- Instead, increase split's size
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })
-- visual mode
map("v", "<Up>", "<Nop>", { noremap = true, silent = true })
map("v", "<Down>", "<Nop>", { noremap = true, silent = true })
map("v", "<Left>", "<Nop>", { noremap = true, silent = true })
map("v", "<Right>", "<Nop>", { noremap = true, silent = true })
-- insert mode
map("i", "<Up>", "<Nop>", { noremap = true, silent = true })
map("i", "<Down>", "<Nop>", { noremap = true, silent = true })
map("i", "<Left>", "<Nop>", { noremap = true, silent = true })
map("i", "<Right>", "<Nop>", { noremap = true, silent = true })

map("n", "<leader>p", '"0p', { noremap = true, silent = true, desc = "Paste from clipboard" }) -- Paste from clipboard in normal
map("v", "<leader>p", '"0p', { noremap = true, silent = true, desc = "Paste from clipboard" }) -- Paste from clipboard in visual
map("n", "<leader>re", ":registers<CR>", { noremap = true, silent = true, desc = "Show registers" }) -- Show registers in normal mode

-- Swap default nvchad terminal mappings for toggleable vs simple term
map("n", "<A-v>", function()
	require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal vertical term" })

-- also now using leader t o for opening instead of leader v
map({ "n" }, "<leader>to", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal new toggleable vertical term" })
-- closing with q
map({ "n" }, "q", function()
	if vim.bo.buftype == "terminal" then
		require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
	else
		-- Use the default behavior of 'q' when not in a terminal buffer
		local ok, char = pcall(vim.fn.getcharstr)
		if ok then
			vim.api.nvim_feedkeys("q" .. char, "n", false)
		end
	end
end, { desc = "Close terminal in terminal buffer, record macro otherwise" })

-- esc instead of C-x to escape
map("t", "<ESC>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
