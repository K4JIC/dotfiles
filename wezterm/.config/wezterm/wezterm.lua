local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 1920x1080解像度で、横幅半分の960pxを目指します
-- フォントサイズ11の場合、だいたい110〜115文字程度になります。
-- 前回の100よりさらに小さく「95」で試してみましょう。
config.initial_cols = 95
config.initial_rows = 38

-- ターミナル側でサイズを自動調整しない
config.adjust_window_size_when_font_size_changes = false

-- フォント設定
config.font_size = 11.0
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
  'Noto Sans JP',
})

-- 外観の調整
config.color_scheme = 'Dark+'
config.window_background_opacity = 0.9

return config
