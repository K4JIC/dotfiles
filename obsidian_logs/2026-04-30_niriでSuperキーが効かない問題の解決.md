---
title: "niriでSuperキーが効かない問題の解決"
date: 2026-04-30
auther: tozaki
tags:
  - log
  - niri
  - wayland
  - troubleshooting
---

## 背景
niriのconfigファイル（`config.kdl`）において、Superキー（Modキー）を組み合わせたホットキー（`Super+Alt+L`など）が反応しない問題が発生した。

## 解決策
主にXKBのキーボードモデル指定不足や、niriの動作環境（ネスト状態など）によるModキーの自動判定エラーが原因として考えられるため、以下の設定を `config.kdl` に明示的に追記する。

### 知見/コード
`niri/config.kdl` の `input` セクションを以下のように修正・追記する。

```kdl
input {
    keyboard {
        xkb {
            layout "jp"
            model "jp106" // 追記: 日本語106/109キーボードとして正しく認識させるため
        }
    }
    
    // 追記: Modキーを明示的にSuperに固定する（ネスト起動時のAltへのフォールバックを防ぐ）
    mod-key "Super" 
}
```

### その他の切り分け・確認事項
1. **ネスト起動の確認**: niriが別のデスクトップ環境上で動いている場合、ホスト側との衝突を避けるため `Mod` が `Alt` になる。`Mod+T` が `Alt+T` で動くか確認する。
2. **Win Lock機能**: ゲーミングキーボードなどで物理的なWindowsキー無効化機能（`Fn + Win` 等）が有効になっていないか確認する。
3. **wevコマンドでの調査**: `wev` コマンドを実行し、Superキーを押した際に `Super_L` のイベントが発生しているか確認する。
