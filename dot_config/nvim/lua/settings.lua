-- settings.lua: 基本設定

-- ========== encoding ==========

-- 文字エンコーディングをUTF-8に設定
vim.o.encoding = "utf-8"
-- スクリプトのエンコーディングをUTF-8に設定
vim.scriptencoding = "utf-8"

-- ========== display ==========

-- 行番号を表示
vim.o.number = true

-- :split コマンドを実行時、新しいウィンドウが下に表示
vim.o.wildmenu = true

-- 常に左にシグナルカラムを表示
vim.o.signcolumn = "yes"

-- ========== search ==========

-- 検索結果をハイライト
vim.o.hlsearch = true
-- 検索時に大文字小文字を無視
vim.o.ignorecase = true
-- 大文字が含まれている場合は区別
vim.o.smartcase = true

-- ========== editing ==========

-- カーソルホールドの待機時間を250msに短縮
vim.o.updatetime = 250

-- タブ関連の設定
-- タブをスペースに変換
vim.o.expandtab = true
-- 自動インデント時のスペース数を4に設定
vim.o.shiftwidth = 4
-- タブ文字の表示幅を4に設定
vim.o.tabstop = 4
-- タブキー入力時のスペース数を4に設定
vim.o.softtabstop = 4
-- 新しい行で前の行のインデントを継続
vim.o.autoindent = true
-- 自動的に適切なインデントを追加
vim.o.smartindent = true

-- ========== Input Method (IME) Auto Switch ==========
-- fcitx-remote-for-osx でローマ字入力に切り替える関数を定義
local function switch_to_roman()
	vim.fn.system("fcitx-remote -c")
end

-- 自動コマンドでモード切り替え時にローマ字入力へ戻す
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = switch_to_roman,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "*",
	callback = switch_to_roman,
})
