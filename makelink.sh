#!/bin/bash

DOTFILES_DIR=~/dotfiles

echo "stow を使用してシンボリックリンクを更新します"

cd "$DOTFILES_DIR"

# 管理対象のパッケージをリストアップ（.git などを除くディレクトリ）
PACKAGES=(*/)
PACKAGES=("${PACKAGES[@]%/}") # 末尾のスラッシュを削除

for pkg in "${PACKAGES[@]}"; do
    # .git などの隠しディレクトリを除外
    [[ "$pkg" == .* ]] && continue
    
    if [ -d "$pkg" ]; then
        echo "$pkg のリンクを作成/更新します"
        stow -R "$pkg"
    fi
done

echo "完了しました"
