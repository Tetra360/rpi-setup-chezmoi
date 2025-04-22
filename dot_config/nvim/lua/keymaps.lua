-- lua/keymaps.lua

-- キーマッピング用のユーティリティ関数
local keymap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Telescope のキーマップ設定
-- ff: ファイル検索、fg: テキスト検索、fb: バッファ一覧、fh: ヘルプタグ検索、fr: 最近のファイル
keymap("n", "ff", ":Telescope find_files hidden=true<CR>")
keymap("n", "fg", ":Telescope live_grep<CR>")
keymap("n", "fb", ":Telescope buffers<CR>")
keymap("n", "fh", ":Telescope help_tags<CR>")
keymap("n", "fr", ":Telescope oldfiles<CR>")

-- NvimTree のキーマップ設定
-- tf: ファイルツリーの表示/非表示を切り替え
keymap("n", "tf", ":NvimTreeToggle<CR>")

-- toggleterm.nvim のキーマップ設定
keymap("n", "tt", ":ToggleTerm<CR>")

-- comment.nvim のキーマップ設定
-- //: ノーマルモードで現在行のコメント切り替え、ビジュアルモードで選択範囲のコメント切り替え
keymap("n", "//", ":lua require('Comment.api').toggle.linewise.current()<CR>")
keymap("x", "//", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
