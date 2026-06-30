return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = require("configs.telescope"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"github/copilot.vim",
		cmd = "Copilot",
	},

	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		lazy = false,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		opts = require("configs.copilotChat"),

		cmd = "CopilotChat",
	},

	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	event = "VimEnter",
	-- 	opts = {},
	-- },

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
			timeout = 2000,
			focusable = false,
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>dd",
				"<cmd>Trouble diagnostics toggle focus=true win.type=split <cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>ql",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
