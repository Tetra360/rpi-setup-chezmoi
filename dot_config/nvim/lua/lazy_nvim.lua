-- lazy_nvim.lua: lazy.nvimのインストールとセットアップ

-- lazy.nvimのインストールパスを指定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- lazy.nvimがインストールされていない場合
if not vim.loop.fs_stat(lazypath) then
    -- Gitを使ってlazy.nvimをクローン
    vim.fn.system({
        "git",                                     -- Gitコマンド
        "clone",                                   -- クローンする
        "--filter=blob:none",                      -- 不要なファイルを除外してクローン
        "https://github.com/folke/lazy.nvim.git",  -- リポジトリのURL
        "--branch=stable",                         -- 安定版を使用
        lazypath,                                  -- インストール先のパス
    })
end

-- lazy.nvimのパスをNeovimのランタイムに追加
vim.opt.runtimepath:prepend(lazypath)
