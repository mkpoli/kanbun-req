# kanbun-req

訓点漢文組版の要件
Requirements for Annotated Kanbun Text Layout

## 概要 / Introduction

本レポジトリは、日本の伝統的な漢文を読解するための漢文訓読という手法に際し、漢文の訓点文、即ち漢字のみの白文に、訓点と呼ばれるあらゆるアノテーションが付加されたものを、組版する際に応って求められるあらゆる事項について記述するイニシャティヴの拠点である。

This repository serves as a hub for an initiative that documents all requirements involved in typesetting _kanbun kundoku_, the traditional Japanese method for reading and interpreting Classical Chinese texts. In this practice, various annotations known as _kunten_ are added to an original _hakubun_ text—that is, a text consisting solely of Chinese characters without punctuation or reading aids. The purpose of this initiative is to comprehensively describe all matters that must be addressed when typesetting such annotated kanbun texts.

## 執筆 / Writing

本ドキュメントはTypstによって執筆され、[定義されたGitHub Actions](.github/workflows/build.yaml)により自動的にPDFまたはHTML形式に配布されます。

This document is written in Typst and will be distributed in PDF or HTML format automatically by [defined GitHub Actions](.github/workflows/build.yaml).

### 手動プレビュー / Manual Preview

```bash
typst compile main.typ --format pdf
```

```bash
typst compile main.typ --format html --features html
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
