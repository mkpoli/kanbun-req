# kanbun-req

![WIP](https://img.shields.io/badge/status-WIP-yellow)

訓点漢文組版の要件
Requirements for Annotated Kanbun Text Layout

## 概要 / Introduction

本レポジトリは、日本の伝統的な漢文を読解するための漢文訓読という手法に際し、漢文の訓点文、即ち漢字のみの白文に、訓点と呼ばれるあらゆるアノテーションが付加されたものを、組版する際に応って求められるあらゆる事項について記述するイニシャティヴの拠点である。

This repository serves as a hub for an initiative that documents all requirements involved in typesetting _kanbun kundoku_, the traditional Japanese method for reading and interpreting Classical Chinese texts. In this practice, various annotations known as _kunten_ are added to an original _hakubun_ text—that is, a text consisting solely of Chinese characters without punctuation or reading aids. The purpose of this initiative is to comprehensively describe all matters that must be addressed when typesetting such annotated kanbun texts.

## 執筆 / Writing

本ドキュメントはTypstによって執筆され、[定義されたGitHub Actions](.github/workflows/build.yaml)により自動的にPDFまたはHTML形式に配布されます。

This document is written in Typst and will be distributed in PDF or HTML format automatically by [defined GitHub Actions](.github/workflows/build.yaml).

### フォント / Fonts

以下のコマンドを実行することにより、必要なフォントをダウンロードすることができます。

You can download the required fonts by running the following command:

```
wget -O fonts/PlanschriftP1-Regular.ttf https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Planschrift_Project/releases/download/V0.0.2007-pre/PlanschriftP1-Regular.ttf
wget -O fonts/PlanschriftP2-Regular.ttf https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Planschrift_Project/releases/download/V0.0.2007-pre/PlanschriftP2-Regular.ttf
wget -O fonts/HaranoAjiMincho-Regular.otf https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Regular.otf
wget -O fonts/HaranoAjiMincho-Bold.otf https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Bold.otf
wget -O fonts/HaranoAjiGothic-Regular.otf https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Regular.otf
wget -O fonts/HaranoAjiGothic-Bold.otf https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Bold.otf
```

### 手動プレビュー / Manual Preview

#### PDFドキュメント

近代活字風ドキュメント
```bash
typst compile main.typ --font-path ./fonts kbreq-planschrift.pdf
```

原ノ味明朝ドキュメント
```bash
typst compile main.typ --font-path ./fonts --input archaism=false kbreq-haranoaji.pdf
```

#### HTMLドキュメント
```bash
typst compile main.typ --format html --features html kbreq.html
```

### ファイル構造 / File Structure

```
.
├── sections
│   └── glossary.typ # 用語表
├── lib.typ # 共通定義
├── main.typ # エントリーポイント
└── README.md # このファイル
```
