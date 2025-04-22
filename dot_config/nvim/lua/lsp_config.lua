-- lsp_config.lua: LSPサーバー自動インストール設定

local lspconfig = require("lspconfig")

-- LSPサーバーのインストール関数
-- 指定したLSPサーバーがグローバルにインストールされていなければ、npmを使って自動でインストール
local function install_lsp_server(server)
	local current_buf = vim.api.nvim_get_current_buf()
	local filename = vim.api.nvim_buf_get_name(current_buf)

	-- npmコマンドを非同期で実行する関数
	local function spawn_npm(args, on_exit)
		local handle
		handle = vim.loop.spawn("npm", { args = args }, function(code)
			handle:close()
			on_exit(code)
		end)
	end

	-- 指定したLSPサーバーがインストールされているかを確認
	spawn_npm({ "list", "-g", server }, function(code)
		-- サーバーがインストールされていない場合、npmで自動インストール
		if code ~= 0 then
			print(server .. "をインストール中...")
			spawn_npm({ "install", "-g", server }, function(success_code)
				if success_code == 0 then
					print(server .. "のインストール完了")
					-- インストール完了後、ファイルを再度読み込み
					vim.defer_fn(function()
						vim.cmd("edit " .. filename)
					end, 0)
				else
					print(server .. "のインストールに失敗しました。")
				end
			end)
		end
	end)
end

-- 必要なLSPサーバーを自動インストール
install_lsp_server("pyright")
install_lsp_server("typescript")
install_lsp_server("typescript-language-server")
