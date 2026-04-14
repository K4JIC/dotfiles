#!/bin/bash

DOTFILES_DIR=~/dotfiles

echo "stow を使用してシンボリックリンクを更新します"

cd "$DOTFILES_DIR"

# 管理対象のパッケージをリストアップ（.git などを除くディレクトリ）
PACKAGES=(bash zsh git vim zed waybar ghostty niri wezterm lazygit kanshi)

for pkg in "${PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "$pkg のリンクを作成/更新します"
        stow -R "$pkg"
    fi
done

echo "完了しました"
