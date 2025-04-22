-- plugins.lua: lazy_nvimによるプラグイン管理

require("lazy").setup({
	-- ========== Colorschemes ==========
	{
		-- Draculaカラースキームの設定
		"dracula/vim",
		config = function()
			-- Draculaカラースキームの設定
			vim.cmd([[colorscheme dracula]])

			-- 背景を透明に設定
			vim.cmd([[highlight Normal ctermbg=none guibg=none]])
			vim.cmd([[highlight NormalNC ctermbg=none guibg=none]])
			vim.cmd([[highlight SignColumn ctermbg=none guibg=none]])
			vim.cmd([[highlight EndOfBuffer ctermbg=none guibg=none]])
		end,
	},

	-- ========== Statusline ==========
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "dracula",
				},
			})
		end,
	},

	-- ========== Syntax Highlighting ==========
	{
		-- 構文ハイライトとインデントの設定
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- ========== Fuzzy Finder ==========
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim",build = "make", },
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					-- レイアウト設定
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							mirror = false,
							preview_height = 0.6,
						},
					},
					file_ignore_patterns = {
						"%.cache/",
						"Library/",
						"node_modules/",
						"Movies",
						"Music",
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--follow",
						"--hidden",
					},
				},
				extensions = {
					-- FZFの設定で検索を高速化
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- fzf拡張を読み込み
			telescope.load_extension("fzf")
		end,
	},

	-- ========== Autocompletion ==========
	{
		-- 自動補完の設定
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<Down>"] = cmp.mapping.select_next_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
				},
			})
		end,
	},

	{
		-- LSP用の補完ソース
		"hrsh7th/cmp-nvim-lsp",
	},

	-- ========== Snippets ==========
	{
		-- スニペットの展開プラグイン
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip").setup({})
		end,
	},

	-- ========== LSP ==========
	{
		-- LSPサーバーの設定
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Python用のLSP
			lspconfig.pyright.setup({})

			-- TypeScript用のLSP
			lspconfig.ts_ls.setup({})
		end,
	},

	-- ========== Git ==========
	{
		-- Gitの変更を表示する
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},

	-- ========== Autopairs ==========
	{
		-- 括弧の自動補完
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- ========== Utilities ==========
	{
		-- ユーティリティ関数の集まり
		"nvim-lua/plenary.nvim",
	},

	-- ========== Terminal Manager ==========
	{
		-- Neovimでのターミナル管理
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({})
		end,
	},

	-- ========== File Explorer ==========
	{
		-- ファイルツリー表示
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				filters = {
					-- ドットファイルを表示するか
					dotfiles = false,
					-- 無視するディレクトリを指定
					custom = { ".git", "node_modules", ".cache" },
				},
				git = {
					-- Git情報を有効にする
					enable = true,
					-- Gitで無視されたファイルを表示するか
					ignore = false,
				},
				view = {
					-- NvimTreeの幅
					width = 30,
					-- NvimTreeを表示する側
					side = "left",
				},
			})
		end,
	},

	-- ========== Code Commenting ==========
	{
		-- コメントアウト
		"numToStr/comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	},
})
