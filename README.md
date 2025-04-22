# Dotfiles

このリポジトリは、私のdotfiles設定を管理するためのものです。

## 含まれる設定

- zsh設定
- Neovim設定
- Homebrewパッケージ管理
- その他の開発ツール設定

## セットアップ

```bash
# chezmoiを使用してセットアップ
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git
chezmoi apply
```

## 管理しているパッケージ

主なパッケージは`Brewfile`に記載されています：

- zsh: シェル
- chezmoi: Dotfile管理ツール
- neovim: テキストエディタ
- nvm: Node.jsバージョン管理
- pyenv: Pythonバージョン管理
- その他開発ツール 