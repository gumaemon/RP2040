# RP2040 Keyboard Quantizer Project

RP2040マイコン用のキーボード＆クォンタイザープロジェクトです。

Pico SDK を使った CMake ベースのビルドシステムを採用しています。

## セットアップと使い方

### 前提条件

**macOS:**
```bash
brew install cmake arm-none-eabi-gcc
```

**Ubuntu/Debian:**
```bash
sudo apt install cmake gcc-arm-none-eabi
```

### 1. Pico SDK をクローン

```bash
cd ~
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
```

### 2. 環境変数を設定

```bash
export PICO_SDK_PATH=~/pico-sdk
```

`.zshrc` または `.bash_profile` に追加して永続化：
```bash
echo 'export PICO_SDK_PATH=~/pico-sdk' >> ~/.zshrc
source ~/.zshrc
```

### 3. ビルド実行

```bash
cd ~/RP2040
make build
```

### 4. ビルド結果

成功すると以下が生成されます：
```
build/src/keyboard_quantizer.uf2
```

### 5. Pico にフラッシュ

1. RP2040 を **BOOTSEL ボタンを押しながら** PC に接続
2. 表示されたドライブに `.uf2` ファイルをコピー：

```bash
cp build/src/keyboard_quantizer.uf2 /Volumes/RPI-RP2/  # macOS
```

## プロジェクト構成

```
.
├── CMakeLists.txt           # ルートビルド設定
├── pico_sdk_import.cmake    # SDK インポート
├── Makefile                 # ビルドヘルパー
├── src/
│   ├── CMakeLists.txt       # ソースビルド設定
│   └── blink.c              # メインプログラム
└── keyboards/               # キーボード設定用ディレクトリ
```

## トラブルシューティング

**CMake エラー: PICO_SDK_PATH が見つからない**
```bash
export PICO_SDK_PATH=~/pico-sdk
```

**ビルド失敗する場合：**
```bash
rm -rf build
make build
```

## 参考資料

- [Raspberry Pi Pico Documentation](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html)
- [Pico SDK GitHub](https://github.com/raspberrypi/pico-sdk)
- [Pico Examples](https://github.com/raspberrypi/pico-examples)
