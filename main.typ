#import "./lib.typ": doc, g, i, ruby
#import "hundouk/src/lib.typ": kanbun
#let archaism = not ("archaism" in sys.inputs and sys.inputs.archaism == "false")

#set text(
  font: if archaism {
    (
      "遍玨體P1",
      "遍玨體P2",
    )
  } else {
    (
      "Harano Aji Mincho",
    )
  },
  lang: "ja",
)

#set page(
  background: if archaism {
    box(
      width: 100%,
      height: 100%,
      fill: rgb("#f9f2e3"),
    )
  } else {
    none
  },
)

#show: doc.with(
  title-ja: "訓点漢文組版要件",
  title-en: "Requirements for Annotated Kanbun Text Layout",
  editors: (
    "まくぽり (mkpoli)",
  ),
  appendices: include "sections/appendices.typ",
)

#set heading(numbering: "1.")

この文書は、PDF版が#link("https://github.com/mkpoli/kanbun-req")[GitHub上]（#link("https://github.com/mkpoli/kanbun-req/releases/latest")）に配布され、HTML版が#link("https://kanbun-req.mkpo.li/")にて公開されている。意見、訂正等は#link("https://github.com/mkpoli/kanbun-req/issues")[GitHubレポジトリのIssues]また#link("https://github.com/mkpoli/kanbun-req/pulls")[Pull Request]にて議論するものとする。

The PDF version of this document is distributed on #link("https://github.com/mkpoli/kanbun-req")[GitHub] (#link("https://github.com/mkpoli/kanbun-req/releases/latest")), and the HTML version is published at #link("https://kanbun-req.mkpo.li/"). Opinions, corrections, etc. shall be discussed via #link("https://github.com/mkpoli/kanbun-req/issues")[Issues in the GitHub repository] or #link("https://github.com/mkpoli/kanbun-req/pulls")[Pull Requests].


= 緒論 / Introduction

この文書は、#g("訓点漢文")の組版にあたって求められる事項について説明するものである。なお、訓点漢文を組版するあらゆる事項について網羅的に説明するものではなく、一般的な日本語組版処理の要件と異なるものを中心に、訓点漢文の組版に必要と思われるものを言及するものである。したがって、本文書の要求を実装することで、訓点漢文の組版のほとんどの需要を満たすことができる。また、訓点漢文の組版にあたって表現される慣行について記述するものであり、具体的な実装については考慮しないものとする。よって、本文書は概ねW3Cの「_Requirements for Japanese Text Layout_ 日本語組版処理の要件」（jlreq）#[@jlreq]の体裁に沿って、訓点漢文に特化した記述を行うものである。

= 訓点漢文の文字 / Characters of Annotated Kanbun Text

一般的な日本語組版と同様、#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]及び#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]が使用され、それに加えてUnicode漢文記号（@kanbun-block-chars）が利用される場合もある。現代の訓点漢文において一般的に、例えば#[@fig:sinobazu]のように、#g("白文")は#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#g("振り仮名")は#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]、#g("送り仮名")は#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]、#g("返点")は漢文記号（@kanbun-block-chars）、またはそれに相当する元の文字が使用される（特に「五」など、珍しいが漢文記号に収録されていないものは漢字を使う他ない）。

#figure(
  caption: [「#ruby[しのばずのいけ][不忍池]」（東京都台東区の地名）],
  kanbun("不(ず)ノ[レ]忍(しの)バ池(いけ)"),
) <fig:sinobazu>

== 縦組の字形 / Character Shape in Vertical Writing

縦組と横組とでは、文字の形が異なる場合がある。

#i[
  OpenTypeフォントではOpenType機能の`vert`フラグによって実装されることが多い。
]

= 文字配置 / Character Placement

訓点漢文の組版においては、一般的な日本語の組版と同様、@fig:jp-char\のように赤い枠で囲まれた字面と、青い枠で囲まれた外枠があり、基本的には正方形の外枠を基準に文字が配置される。

#figure(
  caption: "日本語組版における文字の構造",

  context {
    set text(
      40pt,
      font: "Noto Serif CJK JP",
      top-edge: "bounds",
      bottom-edge: "bounds",
    )
    grid(
      columns: 3,
      column-gutter: 20pt,
      {
        let b = box(stroke: red + 0.5pt, width: 0.94em, outset: (right: -0.0025em))[心]
        let c = box(stroke: blue + 0.5pt, height: 1em, width: 1em, align(center + horizon)[#b])
        c
      },
      {
        let b = box(stroke: red + 0.5pt, width: 0.50em, outset: (left: 0.1em, right: 0.007em))[ノ]
        let c = box(stroke: blue + 0.5pt, height: 1em, width: 1em, align(center + horizon)[#b])
        c
      },
      {
        let b = box(stroke: red + 0.5pt, outset: (left: -0.125em, right: -0.1em))[あ]
        let c = box(stroke: blue + 0.5pt, height: 1em, width: 1em, align(center + horizon)[#b])
        c
      },
    )
  },
) <fig:jp-char>

訓点漢文においては、１つの漢字が中心となって１つの基本ユニットとなり、それぞれの要素が漢字を中心に配置され、オレンジ枠で囲まれているように、長方形または正方形の外枠を持つ。

#figure(
  caption: "訓点漢文の基本単位",

  context {
    set text(
      40pt,
      font: "Noto Serif CJK JP",
      top-edge: "bounds",
      bottom-edge: "bounds",
    )
    grid(
      columns: 3,
      column-gutter: 20pt,
      {
        let glyph-box(c, w, h, font-size: 1em) = {
          let b = text(size: font-size, c)
          box(stroke: blue + 0.5pt, width: w, height: h, align(center + horizon, b))
        }

        box(
          stroke: orange + 0.5pt,
          outset: (bottom: -0.08em),
          grid(
            columns: (0.5em, 0.5em, 0.5em, 0.5em),
            rows: (0.5em, 0.5em, auto),
            align: center + horizon,

            grid.cell(x: 0, y: 0, rowspan: 2, glyph-box("せ", 0.5em, 0.5em, font-size: 0.5em)),
            grid.cell(x: 1, y: 0, colspan: 2, rowspan: 2, glyph-box("爲", 1em, 1em)),
            move(
              dy: 0.25em,
              grid.cell(x: 3, y: 0, align: bottom, rowspan: 2, glyph-box("な", 0.5em, 0.5em, font-size: 0.5em)),
            ),

            grid.cell(x: 1, y: 2, align: right + top, {
              glyph-box(
                stack(
                  dir: ttb,
                  spacing: -0.35em,
                  "一",
                  "レ",
                ),
                0.5em,
                auto,
                font-size: 0.5em,
              )
            }),
            grid.cell(x: 3, y: 2, align: left + top, {
              move(
                dy: -0.25em,
                glyph-box("サ", 0.5em, 0.5em, font-size: 0.5em),
              )
            }),
          ),
        )
      },
    )
  },
) <fig:kanbun-unit>



== アキ組とベタ組 / Akigumi and Betagumi

一般的な日本語組版は、#g("ベタ組")を基本にするのに対し、訓点漢文の組版はベタ組の他に、#g("アキ組")も常用される。

#let 登鸛鵲楼 = "白日依リテ[レ]山ニ盡キ，黃河入リテ[レ]海ニ流ル。欲シ[二]窮メント[一]千里ノ目ヲ，更ニ上ル一層ノ樓。"
#grid(
  columns: 2,
  figure(
    caption: "ベタ組の〔唐〕王之渙『登鸛鵲樓』",
    gap: 2em,
    kanbun(
      height: 10em,
      登鸛鵲楼,
      use-unicode-kanbun: false,
    ),
  ),
  figure(
    caption: "アキ組の〔唐〕王之渙『登鸛鵲樓』",
    gap: 2em,
    kanbun(
      height: 12em,
      登鸛鵲楼,
      tight: false,
      use-unicode-kanbun: false,
    ),
  ),
)

== 縦組と横組 / Vertical and Horizontal Writing Mode

訓点漢文は基本的に#g("縦組")を採用するが、組版環境の制約などによっては#g("横組")を採用する場合もある。

#let 靜夜思 = "床前看[二]ル月光ヲ[一]，
 疑ウラクハ[二]是レ地上ノ霜カト[一]。
 舉[レ]ゲテ頭ヲ望ム[二]山月ヲ[一]，
  低[レ]レテ頭ヲ思フ[二]故鄕ヲ[一]。"
#grid(
  columns: 2,
  figure(
    caption: "縦組の「静夜思」",
    gap: 2em,
    kanbun(
      height: 12em,
      靜夜思,
      tight: false,
      use-unicode-kanbun: false,
    ),
  ),
  figure(
    caption: "横組の「静夜思」",
    gap: 2em,
    kanbun(
      靜夜思,
      writing-direction: ltr,
      use-unicode-kanbun: false,
    ),
  ),
)

== 振り仮名と送り仮名 / Furigana and Okurigana

== 返点 / Kaeriten

== 約物 / Punctuations

=== 句読点 / Periods and Commas

=== 疑問符・感嘆符 / Question Mark and Exclamation Mark

=== コロン・セミコロン / Colon and Semicolon

#bibliography("refs.yml", title: "参考文献 / Bibliography", style: "american-chemical-society")
